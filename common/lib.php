<?php
/**
 * Common library of usefull functions for Pandao CMS
 */
class DB extends PDO
{
    public function last_row_count()
    {
        return $this->query('SELECT FOUND_ROWS()')->fetchColumn();
    }
}
/**
 * autoload()
 *
 * @param string $classname The name of the class to load
 */
function autoloader($classname)
{
    $admin_folder = defined('PMS_ADMIN_FOLDER') ? PMS_ADMIN_FOLDER : 'admin';
    $filename = SYSBASE.$admin_folder.'/includes/'.$classname.'.class.php';
    if(is_file($filename)) require_once($filename);
}
if(version_compare(PHP_VERSION, '5.1.2', '>=')){
    if(version_compare(PHP_VERSION, '5.3.0', '>='))
        spl_autoload_register('autoloader', true, true);
    else
        spl_autoload_register('autoloader');
}else{
	try{
		spl_autoload_register('autoloader', true, true);
	}catch(Exception $e){
		/**
		 * Fall back to traditional autoload for old PHP versions
		 * @param string $classname The name of the class to load
		 */
		function __spl_autoload_register($classname)
		{
			autoloader($classname);
		}
	}
}

function pms_is_session_started()
{
    if(php_sapi_name() !== 'cli'){
        if(version_compare(phpversion(), '5.4.0', '>='))
            return session_status() === PHP_SESSION_ACTIVE ? true : false;
        else
            return session_id() === '' ? false : true;
    }
    return false;
}

if(!function_exists('array_column')){
    function array_column(array $input, $columnKey, $indexKey = null)
    {
        $array = array();
        foreach($input as $value) {
            if(!array_key_exists($columnKey, $value)){
                trigger_error('Key "'.$columnKey.'" does not exist in array');
                return false;
            }
            if(is_null($indexKey))
                $array[] = $value[$columnKey];
            else{
                if(!array_key_exists($indexKey, $value)){
                    trigger_error('Key "'.$indexKey.'" does not exist in array');
                    return false;
                }
                if(!is_scalar($value[$indexKey])){
                    trigger_error('Key "'.$indexKey.'" does not contain scalar value');
                    return false;
                }
                $array[$value[$indexKey]] = $value[$columnKey];
            }
        }
        return $array;
    }
}
/***********************************************************************
 * pms_db_prepareInsert() prepare a query for an insertion into the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param array $data       array of values indexed by columns name
 *
 * @return PDOStatement
 *
 */
function pms_db_prepareInsert($pms_db, $table, $data)
{
    $result = $pms_db->query('SELECT * FROM '.$table.' LIMIT 1');
    $list_cols = pms_db_list_columns($pms_db, $table);
    $nb_cols = count($list_cols);
    $query = 'INSERT INTO '.$table.' VALUES(';
    foreach($list_cols as $i => $column){
        $query .= ':'.$column;
        if($i < $nb_cols-1) $query .= ', ';
    }
    $query .= ')';
    $result = $pms_db->prepare($query);
    foreach($list_cols as $i => $column){
        if(array_key_exists($column, $data)){
            $col_type = pms_db_column_type($pms_db, $table, $column);
            $value = (is_null($data[$column]) || (preg_match('/.*(char|text).*/i', $col_type) !== 1 && $data[$column] == '')) ? null : html_entity_decode($data[$column]);
            $result->bindValue(':'.$column, $value);
        }else
            $result->bindValue(':'.$column, null);
    }
    return $result;
}
/***********************************************************************
 * pms_db_prepareUpdate() prepare a query for an update into the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param array $data       array of values indexed by columns name
 *
 * @return PDOStatement
 *
 */
function pms_db_prepareUpdate($pms_db, $table, $data)
{
    $result = $pms_db->query('SELECT * FROM '.$table.' LIMIT 1');
    $list_cols = pms_db_list_columns($pms_db, $table);
    $count_cols = 0;
    $nb_cols = 0;
    foreach($list_cols as $column)
        if($column != 'id' && $column != 'lang' && array_key_exists($column, $data)) $nb_cols++;
    $query = 'UPDATE '.$table.' SET ';
    foreach($list_cols as $i => $column){
        if($column != 'id' && $column != 'lang' && array_key_exists($column, $data)){
            $query .= '`'.$column.'` = :'.$column;
            if($count_cols < $nb_cols-1) $query .= ', ';
            $count_cols++;
        }
    }
    $query .= ' WHERE id = '.$data['id'];
    if(isset($data['lang']) && pms_db_column_exists($pms_db, $table, 'lang')) $query .= ' AND lang = '.$pms_db->quote($data['lang']);
    $result = $pms_db->prepare($query);
    foreach($list_cols as $i => $column){
        if($column != 'id' && $column != 'lang' && array_key_exists($column, $data)){
            $col_type = pms_db_column_type($pms_db, $table, $column);
            $value = (is_null($data[$column]) || (preg_match('/.*(char|text).*/i', $col_type) !== 1 && $data[$column] == '')) ? null : html_entity_decode($data[$column]);
            $result->bindValue(':'.$column, $value);
        }
    }
    return $result;
}
/***********************************************************************
 * pms_db_table_exists() checks if a table exists in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 *
 * @return boolean
 *
 */
function pms_db_table_exists($pms_db, $table)
{
    $result = $pms_db->query('SHOW TABLES LIKE '.$pms_db->quote($table));
    if($result !== false && $pms_db->last_row_count() > 0)
        return true;
    else
        return false;
}
/***********************************************************************
 * pms_db_column_exists() checks if a column exists in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param string $column    concerned column
 *
 * @return boolean
 *
 */
function pms_db_column_exists($pms_db, $table, $column)
{
    $result = $pms_db->query('SELECT * FROM information_schema.COLUMNS WHERE TABLE_NAME = '.$pms_db->quote($table).' AND TABLE_SCHEMA = '.$pms_db->quote(PMS_DB_NAME).' AND COLUMN_NAME = '.$pms_db->quote($column));
    if($result !== false && $pms_db->last_row_count() > 0)
        return true;
    else
        return false;
}
/***********************************************************************
 * pms_db_descr_table() gets the description of a table in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param string $column    concerned column
 *
 * @return array table description
 *
 */
function pms_db_descr_table($pms_db, $table, $column = '')
{
    $query = 'DESCRIBE '.$table;
    if($column != '') $query .= ' `'.$column.'`';
    $result = $pms_db->query($query)->fetchAll();
    return $result;
}
/***********************************************************************
 * pms_db_list_columns() returns the list of the columns name of a table in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 *
 * @return array columns list
 *
 */
function pms_db_list_columns($pms_db, $table)
{
    $descr = pms_db_descr_table($pms_db, $table);
    if(is_array($descr) && count($descr) > 0){
        foreach($descr as $field)
            $fields[] = $field[0];
        return $fields;
    }else
        return false;
}
/***********************************************************************
 * pms_db_column_type() returns the type of a column in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param string $column    concerned column
 *
 * @return string column type
 *
 */
function pms_db_column_type($pms_db, $table, $column)
{
    $type = false;
    if(is_numeric($column)){
        $descr = pms_db_descr_table($pms_db, $table);
        if(is_array($descr) && isset($descr[$column]))
            $type = $descr[$column]['Type'];
    }else{
        $descr = pms_db_descr_table($pms_db, $table, $column);
        if(is_array($descr) && count($descr) == 1)
        $type = $descr[0]['Type'];
    }
    return $type;
}
/***********************************************************************
 * pms_img_resize() copies and resizes an image
 *
 * @param string $source_file   source file path
 * @param string $dest_dir      target directory path
 * @param integer $max_w        maximum width
 * @param integer $max_h        maximum height
 *
 * @return boolean
 *
 */
function pms_img_resize($source_file, $dest_dir, $max_w, $max_h, $stamp_file = null)
{
    $return = false;
    if(substr($dest_dir, 0,-1) != '/') $dest_dir .= '/';

    if(is_file($source_file) && is_dir($dest_dir)){

        $pos = strrpos($source_file, '/');
        if($pos !== false)
            $filename = substr($source_file, $pos+1);
        else
            $filename = $source_file;

        $im_size = getimagesize($source_file);
        $w = $im_size[0];
        $h = $im_size[1];
        $im_type = $im_size[2];

        if($h<$max_h){
            if($w<$max_w){
                $new_w=$w;
                $new_h=$h;
            }else{
                $new_w=$max_w;
                $new_h=round($max_w*$h/$w);
            }
        }else{
            $new_w=$max_w;
            $new_h=round($max_w*$h/$w);

            if($new_h > $max_h){
                $new_h=$max_h;
                $new_w=round($max_h*$w/$h);
            }
        }

        if(!is_null($stamp_file) && is_file($stamp_file)){

            $margin_right = 10;
            $margin_bottom = 10;

            $stamp_size = getimagesize($stamp_file);
            $sw = $stamp_size[0];
            $sh = $stamp_size[1];
            $s_type = $stamp_size[2];

            $new_sw = round($sw*$new_w/MAX_W_BIG);
            $new_sh = $new_sw*$sh/$sw;

            switch($s_type){
                case IMAGETYPE_JPEG : $tmp_stamp = imagecreatefromjpeg($stamp_file); break;
                case IMAGETYPE_PNG : $tmp_stamp = imagecreatefrompng($stamp_file); break;
                case IMAGETYPE_GIF : $tmp_stamp = imagecreatefromgif($stamp_file); break;
            }

            $new_stamp = imagecreatetruecolor($new_sw, $new_sh);

            if($s_type == IMAGETYPE_PNG){
                imagesavealpha($new_stamp, true);
                $trans_colour = imagecolorallocatealpha($new_stamp, 0, 0, 0, 127);
                imagefill($new_stamp, 0, 0, $trans_colour);

                $im = imagecreatetruecolor($new_sw, $new_sh);
                $bg = imagecolorallocate($im, 0, 0, 0);
                imagecolortransparent($new_stamp, $bg);
                imagedestroy($im);
            }

            imagecopyresampled($new_stamp, $tmp_stamp, 0, 0, 0, 0, $new_sw, $new_sh, $sw, $sh);
        }

        switch($im_type){
            case IMAGETYPE_JPEG : $tmp_image = imagecreatefromjpeg($source_file); break;
            case IMAGETYPE_PNG : $tmp_image = imagecreatefrompng($source_file); break;
            case IMAGETYPE_GIF : $tmp_image = imagecreatefromgif($source_file); break;
        }

        $new_image = imagecreatetruecolor($new_w, $new_h);

        if($im_type == IMAGETYPE_PNG){
            imagesavealpha($new_image, true);
            $trans_colour = imagecolorallocatealpha($new_image, 0, 0, 0, 127);
            imagefill($new_image, 0, 0, $trans_colour);

            $im = imagecreatetruecolor($new_w, $new_h);
            $bg = imagecolorallocate($im, 0, 0, 0);
            imagecolortransparent($new_image, $bg);
            imagedestroy($im);
        }

        if(imagecopyresampled($new_image, $tmp_image, 0, 0, 0, 0, $new_w, $new_h, $w, $h)){
            if(isset($tmp_stamp)) imagecopy($new_image, $new_stamp, $new_w-$new_sw-$margin_right, $new_h-$new_sh-$margin_bottom, 0, 0, $new_sw, $new_sh);

            switch($im_type){
                case IMAGETYPE_JPEG : imagejpeg($new_image, $dest_dir.$filename, 80); break;
                case IMAGETYPE_PNG : imagepng($new_image, $dest_dir.$filename, 8); break;
                case IMAGETYPE_GIF : imagegif($new_image, $dest_dir.$filename); break;
            }

            if(chmod($dest_dir.$filename, 0664)) $return = $dest_dir.$filename;
        }

        if(isset($new_image)) imagedestroy($new_image);
        if(isset($tmp_image)) imagedestroy($tmp_image);
        if(isset($new_stamp)) imagedestroy($new_stamp);
        if(isset($tmp_stamp)) imagedestroy($tmp_stamp);
    }
    return $return;
}
/***********************************************************************
 * pms_getFileMimeType() returns the mime type of a file
 *
 * @param string $file path of the file
 *
 * @return string
 */
function pms_getFileMimeType($file)
{
    $type = 'application/octet-stream';
    if(function_exists('finfo_file')){
        $finfo = finfo_open(FILEINFO_MIME_TYPE);
        $type = finfo_file($finfo, $file);
        finfo_close($finfo);
    }elseif(function_exists('mime_content_type'))
        $type = mime_content_type($file);
    else{
        $dim = @getimagesize($file);
        if(is_array($dim) && isset($dim['mime']))
            $type = $dim['mime'];
    }

    if(in_array($type, array('application/octet-stream'))){
        $secondOpinion = @exec('file -b --mime-type '.escapeshellarg($file), $foo, $returnCode);
        if($returnCode === 0 && $secondOpinion)
            $type = $secondOpinion;
    }
    return $type;
}
/***********************************************************************
 * pms_fileSizeConvert() formats a number in bytes for the display (10 MB, 200.20 GB)
 *
 * @param integer $bytes number to format
 *
 * @return string
 */
function pms_fileSizeConvert($bytes)
{
    $bytes = floatval($bytes);
    $arBytes = array(
        0 => array(
            'unit' => 'To',
            'value' => pow(1024, 4)
        ),
        1 => array(
            'unit' => 'Go',
            'value' => pow(1024, 3)
        ),
        2 => array(
            'unit' => 'Mo',
            'value' => pow(1024, 2)
        ),
        3 => array(
            'unit' => 'Ko',
            'value' => 1024
        ),
        4 => array(
            'unit' => 'octets',
            'value' => 1
        ),
    );
    $result = '';
    foreach($arBytes as $arItem){
        if($bytes >= $arItem['value']){
            $result = $bytes / $arItem['value'];
            $result = str_replace('.', ',' , strval(round($result, 2))).' '.$arItem['unit'];
            break;
        }
    }
    return $result;
}
/***********************************************************************
 * pms_recursive_rmdir() deletes or empties a directory recursively
 *
 * @param string $dirname       directory path to delete/empty
 * @param boolean $contentOnly  delete content only ?
 * @param boolean $followLinks  follow symbolic links ?
 *
 * return void
 *
 */
function pms_recursive_rmdir($dirname, $contentOnly = false, $followLinks = false)
{
    if(is_dir($dirname) && !is_link($dirname)){
        if(!is_writable($dirname))
            throw new Exception('You do not have renaming permissions!');

        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($dirname),
            RecursiveIteratorIterator::CHILD_FIRST
        );
        while($iterator->valid()){
            if(!$iterator->isDot()){
                if($iterator->isLink() && false === (boolean) $followLinks) $iterator->next();
                if($iterator->isFile()) unlink($iterator->getPathName());
                elseif($iterator->isDir()) pms_recursive_rmdir($iterator->getPathName());
            }
            $iterator->next();
        }
        unset($iterator);

        if($contentOnly) return true; else return rmdir($dirname);
    }
}
/***********************************************************************
 * pms_db_getRequestSelect() returns a query of selection
 *
 * @param string $table         concerned table
 * @param array $cols           columns (name) to compare
 * @param $q                    searched string
 * @param string $condition     additionnal conditions (WHERE clause)
 * @param string $order         display order of elements (ORDER clause)
 * @param string $limit         maximum elements to display (LIMIT clause)
 * @param string $offset        number of the line where beginning the research (OFFSET clause)
 *
 * @return string query
 *
 */
function pms_db_getRequestSelect($pms_db, $table, $cols, $q, $condition_sup = '', $order = '', $limit = '', $offset = '')
{
    $result = $pms_db->query('SELECT * FROM '.$table.' LIMIT 1');

    $q = mb_strtoupper($q);
    $q = str_replace('%20', ' ', $q);
    $q = preg_replace('/\s\s+/', '', $q);

    $nb_cols = count($cols);

    $query = 'SELECT * FROM '.$table;

    $condition = $condition_sup;

    foreach($cols as $j => $col){
        $arr_colname = preg_split('/([^a-z0-9_]+)/i', $col);

        if($condition_sup != '' && $j == 0) $condition .= ' AND (';

        $nb_subcols = count($arr_colname);
        foreach($arr_colname as $i => $str_colname){

            $col_type = pms_db_column_type($pms_db, $table, $str_colname);

            if(preg_match('/.*(char|text).*/i', $col_type) !== false) $str_colname = 'UPPER('.$str_colname.')';

            $condition .= '('.$str_colname.' LIKE '.$pms_db->quote('%'.$q.'%').') ';

            if($i <= $nb_subcols-2) $condition .= 'OR ';
        }
        if($j <= $nb_cols-2) $condition .= 'OR ';

        if($condition_sup != '' && $j == $nb_cols-1) $condition .= ') ';
    }

    $query .= ($condition != '') ? ' WHERE '.$condition : '';

    if($order != '') $query .= ' ORDER BY '.$order;
    if($limit != '') $query .= ' LIMIT '.$limit;
    if($offset != '') $query .= ' OFFSET '.$offset;

    return $query;
}
/***********************************************************************
 * pms_db_getFieldValue() gets the value of a colmuns in the database
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param string $table     concerned table
 * @param string $col       column name
 * @param integer $id       ID of the entry
 * @param integer $lang     lang ID of the entry
 *
 * @return string value
 *
 */
function pms_db_getFieldValue($pms_db, $table, $col, $id, $lang = 0)
{
    $query = 'SELECT '.$col.' FROM '.$table.' WHERE id = '.$id;
    if($lang > 0 && pms_db_column_exists($pms_db, $table, 'lang')) $query .= ' AND lang = '.$pms_db->quote($lang);
    $result = $pms_db->query($query);
    if($result !== false && $pms_db->last_row_count() > 0){
        $row = $result->fetch(PDO::FETCH_ASSOC);
        $values = array();
        $cols = explode(',', $col);
        foreach($cols as $col) $values[] = $row[$col];
        return implode(' ', $values);
    }else
        return false;
}
/***********************************************************************
 * pms_getNewSize() calculates new dimensions while keeping the proportions
 *
 * @param integer $w        current width
 * @param integer $h        current height
 * @param integer $max_w    maximum width
 * @param integer $max_h    maximum height
 *
 * @return array array containing the new dimensions ([0] => width, [1] => height)
 *
 */
function pms_getNewSize($w, $h, $max_w, $max_h)
{
    if($h<$max_h){
        if($w<$max_w){
            $new_w=$w;
            $new_h=$h;
        }else{
            $new_w=$max_w;
            $new_h=round($max_w*$h/$w);
        }
    }else{
        $new_w=$max_w;
        $new_h=round($max_w*$h/$w);

        if($new_h > $max_h){
            $new_h=$max_h;
            $new_w=round($max_h*$w/$h);
        }
    }
    return array($new_w, $new_h);
}
/***********************************************************************
 * pms_close_html_tags() closes all html tags of a truncated string
 *
 * @param string $text string to format
 *
 * @return string
 *
 */
function pms_close_html_tags($text)
{
    preg_match_all('/<[^>]*>/', $text, $tags);
    $list = array();
    foreach($tags[0] as $tag){
      if($tag[1] != '/'){
          preg_match('/<([a-z]+[0-9]*)/i', $tag, $type);
          if(isset($type[1])) $list[] = $type[1];
      }else{
           preg_match('/<\/([a-z]+[0-9]*)/i', $tag, $type);
           for($i = count($list)-1; $i >= 0; $i--)
                if($list[$i] == $type[1]) $list[$i] = '';
        }
    }
    $closed_tags = '';
    for($i = count($list)-1; $i >= 0; $i--)
        if($list[$i] != '' && $list[$i] != 'br') $closed_tags .= '</'.$list[$i].'>';

    return($text.$closed_tags);
}
/***********************************************************************
 * pms_strtrunc() truncates a string by keeping the HTML formatting
 *
 * @param string $text      string to truncate
 * @param integer $length   maximum number of characters
 * @param string $ending    characters ending the returned string
 * @param boolean $exact    truncate in the middle of a word
 *
 * @return string
 *
 */
function pms_strtrunc($text, $length, $html = true, $ending = '...', $exact = false)
{
    $text = preg_replace('/\s/', ' ', $text);
    $text = preg_replace('/\s\s+/', ' ', $text);

    if(mb_strlen(preg_replace('/<.*?>/is', '', $text)) <= $length) return $text;

    if($html){
        preg_match_all('/(<.+?>)?([^<>]*)/is', $text, $matches, PREG_SET_ORDER);

        $matches_length = 0;
        $content_text = '';
        $tags = array();

        foreach($matches as $match){
            if(!empty($match[0])){
                if(strlen($content_text) < $length){
                    $content_text .= $match[2];
                    if(!empty($match[1])) $tags[strpos($match[0], $match[1]) + $matches_length] = $match[1];
                    $matches_length += strlen($match[0]);
                }else
                    break;
            }
        }
    }else
        $content_text = pms_rip_tags($text);

    $result = substr($content_text, 0, $length);

    if(!$exact){
        $spacepos = strrpos($result, ' ');
        if($spacepos !== false)
            $result = substr($result, 0, $spacepos);
    }
    if($html){
        foreach($tags as $tag_pos => $tag){
            $str_start = substr($result, 0, $tag_pos);
            $str_end = substr($result, $tag_pos, strlen($result) - $tag_pos);
            $result = $str_start.$tag.$str_end;
        }
        $result = pms_close_html_tags($result);
        $result = preg_replace('/<([a-z]+[0-9]*)([^>]*)><\/([a-z]+[0-9]*)>/is', '', $result);
    }
    return $result.$ending;
}
/***********************************************************************
 * pms_cleanAccent() removes all accents from a string
 *
 * @param string $str string to format
 *
 * @return string
 *
 */
function pms_cleanAccent($str)
{
    $unwanted_array = array('Š'=>'S', 'š'=>'s', 'Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A', 'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E',
                            'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I', 'Ï'=>'I', 'Ñ'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O', 'Ø'=>'O', 'Ù'=>'U',
                            'Ú'=>'U', 'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'s', 'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'ç'=>'c',
                            'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o',
                            'ö'=>'o', 'ø'=>'o', 'ù'=>'u', 'ú'=>'u', 'û'=>'u', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y', 'Ğ'=>'G', 'İ'=>'I', 'Ş'=>'S', 'ğ'=>'g', 'ı'=>'i', 'ş'=>'s', 'ü'=>'u',
                            'ă'=>'a', 'Ă'=>'A', 'ș'=>'s', 'Ș'=>'S', 'ț'=>'t', 'Ț'=>'T');
    $str = strtr($str, $unwanted_array);
    return $str;
}
/***********************************************************************
 * pms_mb_substr_replace() equivalement of php native function substr_replace() for multybytes strings
 *
 * @param string $string        input string
 * @param string $replacement   replacement string
 * @param string $start         start position
 * @param string $length        replacement length
 *
 * @return string
 *
 */
function pms_mb_substr_replace($string, $replacement, $start, $length = NULL)
{
    if(is_array($string)){
        $num = count($string);
        $replacement = is_array($replacement) ? array_slice($replacement, 0, $num) : array_pad(array($replacement), $num, $replacement);

        if(is_array($start)){
            $start = array_slice($start, 0, $num);
            foreach ($start as $key => $value)
                $start[$key] = is_int($value) ? $value : 0;
        }else
            $start = array_pad(array($start), $num, $start);

        if(!isset($length)) $length = array_fill(0, $num, 0);
        elseif(is_array($length)){
            $length = array_slice($length, 0, $num);
            foreach ($length as $key => $value)
                $length[$key] = isset($value) ? (is_int($value) ? $value : $num) : 0;
        }else
            $length = array_pad(array($length), $num, $length);

        return array_map(__FUNCTION__, $string, $replacement, $start, $length);
    }
    preg_match_all('/./us', (string)$string, $smatches);
    preg_match_all('/./us', (string)$replacement, $rmatches);
    if($length === NULL) $length = mb_strlen($string);
    array_splice($smatches[0], $start, $length, $rmatches[0]);
    return join($smatches[0]);
}
/***********************************************************************
 * pms_highlight() places custom tags before and after a part of a string
 *
 * @param string $haystack  input string
 * @param string $needle    searched substring
 * @param string $startTag  string to insert before needle
 * @param string $endTag    string to insert after needle
 *
 * @return string
 *
 */
function pms_highlight($haystack, $needle, $startTag = '<b>', $endTag = '</b>')
{
    $needles = explode(' ', $needle);
    $haystack_format = pms_format_string($haystack);
    $startTagLen = mb_strlen($startTag);
    $endTagLen = mb_strlen($endTag);

    foreach($needles as $needle){
        $needle = mb_strtoupper(pms_cleanAccent($needle));
        $offset = 0;
        $len = mb_strlen($needle);
        while(($pos = mb_strpos($haystack_format, $needle, $offset)) !== false){
            $offset = $pos+$startTagLen+$len;
            $haystack = pms_mb_substr_replace($haystack, $startTag, $pos, 0);
            $haystack = pms_mb_substr_replace($haystack, $endTag, $pos+$startTagLen+$len, 0);

            $haystack_format = pms_mb_substr_replace($haystack_format, $startTag, $pos, 0);
            $haystack_format = pms_mb_substr_replace($haystack_format, $endTag, $pos+$startTagLen+$len, 0);
            $offset += $endTagLen;
        }
    }
    return $haystack;
}
/***********************************************************************
 * pms_text_format() formats a string witout special characters
 *
 * @param string $str       string to format
 * @param boolean $tolower  make a string lowercase
 * @param string $sep       words separator
 *
 * @return string
 *
 */
function pms_text_format($str, $tolower = true, $sep = '-')
{
    $str = pms_cleanAccent($str);
    $str = preg_replace('/([^a-z0-9]+)/i', $sep, $str);
    $str = preg_replace('/' . preg_quote($sep, '/') . '+/', $sep, $str);
    $str = trim($str, $sep);
    if ($tolower) {
        $str = strtolower($str);
    }

    // If needed, convert to UTF-8 from ISO-8859-1
    if (mb_detect_encoding($str, 'UTF-8', true) !== 'UTF-8') {
        $str = mb_convert_encoding($str, 'UTF-8', 'ISO-8859-1');
    }

    return $str;
}

/***********************************************************************
 * pms_format_string() formats a string
 *
 * @param string $str       string to format
 * @param boolean $accents  remove the accents
 * @param boolean $alpha    keep only alpha numeric characters
 *
 * @return string
 *
 */
function pms_format_string($str, $accents = true, $alpha = false)
{
    if($accents) $str = pms_cleanAccent($str);
    if($alpha) $str = preg_replace('/([^a-z0-9]+)/i', ' ', $str);
    $str = mb_strtoupper($str, 'UTF-8');
    $str = preg_replace('/\s\s+/', ' ', $str);
    return $str;
}
/***********************************************************************
 * pms_format_string() formats a string for a research
 *
 * @param string $needle searched string to format
 * @param string $len_min minimum length of each searched word
 *
 * @return string
 *
 */
function pms_format_search($needle, $len_min = 3)
{
    $needle = mb_strtoupper(pms_cleanAccent($needle), 'UTF-8');
    $needle = preg_replace('/([^[:alnum:]_\-\']+)/ui', ' ', $needle);

    $needles = preg_split('/\s+/', $needle);

    $needle .= ' '.preg_replace('/[_\-\']/', ' ', $needle);
    $needle = trim(preg_replace('/\s\s+/', ' ', $needle));

    $needles += preg_split('/\s+/', $needle);

    foreach($needles as $i => $ndl)
        if(mb_strlen($ndl) < $len_min)  $needles[$i] = '';

    $needles = array_values(array_filter(array_unique($needles)));

    $needle = implode(' ', $needles);

    return array($needle, $needles);
}
/***********************************************************************
 * pms_db_getSearchRequest() returns a query of research
 *
 * @param PDOStatement $pms_db      database connection ressource
 * @param string $table         concerned table
 * @param array $cols           columns (name) to compare
 * @param string $q             searched string
 * @param integer $limit        maximum elements to display (LIMIT clause)
 * @param integer $offset       number of the line where beginning the research (OFFSET clause)
 * @param string $condition     adding conditions (WHERE clause)
 * @param string $condition     option conditions (OR in WHERE clause)
 * @param string $order         ORDER clause
 * @param string                $select custom SELECT clause
 *
 * @return string query string
 *
 */
function pms_db_getSearchRequest($pms_db, $table, $cols, $q, $limit = 0, $offset = 0, $condition = '', $other_condition = '', $order = '', $select = '', $len_min = 3)
{
    $search = pms_format_search($q, $len_min);
    $q = $search[0];
    $wds = $search[1];

    if($q != ''){
        $nb_wds = count($wds);
        $nb_cols = count($cols);

        $query = 'SELECT';

        if($select != '') $query .= ' '.$select.', ';

        foreach($cols as $j => $col){
            $query .= ' (UPPER(`'.$col.'`) LIKE '.$pms_db->quote($q).') AS found_exact_col'.$j.', ';

            if($nb_wds > 0){
                for($i=0;$i<$nb_wds;$i++){
                    $wd = $wds[$i];
                    if($i == 0) $query .= '(';
                    $query .= '(CASE WHEN(UPPER(`'.$col.'`) LIKE '.$pms_db->quote('%'.$wd.'%').') THEN 1 ELSE 0 END)';
                    if($i <= $nb_wds-2) $query .= ' + ';
                    if($i == $nb_wds-1) $query .= ') AS found_count_col'.$j.', ';
                }
                for($i=0;$i<$nb_wds;$i++){
                    $wd = $wds[$i];
                    $query .= '(UPPER(`'.$col.'`) LIKE '.$pms_db->quote('%'.$wd.'%').') AS found_wd'.$i.'_col'.$j;
                    if($i <= $nb_wds-2) $query .= ', ';
                }
                $query .= ', ';
            }
        }
        $query .= ' `'.$table.'`.* FROM `'.$table.'` ';

        if(($nb_wds > 0 && $nb_cols > 0) || $condition != '' || $other_condition != '') $query .= 'WHERE '.$condition.' ';

        if((($nb_wds > 0 && $nb_cols > 0) || $other_condition != '') && $condition != '') $query .= ' AND ';

        if($nb_wds > 0 && $nb_cols > 0 && $other_condition != '') $query .= ' ( ';

        if($nb_wds > 0){
            foreach($cols as $j => $col){

                for($i=0;$i<$nb_wds;$i++){
                    if($condition != '' && $i == 0 && $j == 0) $query .= ' (';
                    $wd = $wds[$i];
                    if($i == 0) $query .= '(';
                    $query .= 'UPPER(`'.$col.'`) LIKE '.$pms_db->quote('%'.$wd.'%');
                    if($i <= $nb_wds-2) $query .= ' OR ';
                    if($i == $nb_wds-1) $query .= ')';
                    if($condition != '' && $i == $nb_wds-1 && $j == $nb_cols-1) $query .= ') ';
                }
                if($j <= $nb_cols-2) $query .= ' OR ';
            }
        }

        if($other_condition != ''){
            if($nb_wds > 0 && $nb_cols > 0) $query .= ' OR ';
            $query .= '('.$other_condition.')';
            if($nb_wds > 0 && $nb_cols > 0) $query .= ' ) ';
        }

        if(($nb_wds > 0 && $nb_cols > 0) || $order != ''){

            $query .= ' ORDER BY ';

            if($order == '' && $nb_cols > 0){
                foreach($cols as $j => $col)
                    $query .= 'found_exact_col'.$j.' DESC, ';

                if($nb_wds > 0){
                    foreach($cols as $j => $col)
                        $query .= 'found_count_col'.$j.' DESC, ';

                    foreach($cols as $j => $col){
                        for($i=0;$i<$nb_wds;$i++)
                            $query .= 'found_wd'.$i.'_col'.$j.' DESC, ';
                    }
                }
                $query .= implode(',', $cols);
            }else
                $query .= $order;
        }

        if($limit > 0){
            $query .= ' LIMIT '.$limit;
            if($offset > 0) $query .= ' OFFSET '.$offset;
        }
        return $query;

    }else return false;
}
/***********************************************************************
 * pms_br2nl() replaces HTML line breaks with newlines in a string
 *
 * @param string $str string to format
 *
 * @return string
 *
 */
function pms_br2nl($str)
{
    return preg_replace('/\<br\s*\/?\>/i', "\n", $str);
}
/***********************************************************************
 * pms_rip_tags() removes HTML tags from a string
 *
 * @param string $str string to format
 *
 * @return string
 *
 */
function pms_rip_tags($str)
{
    $str = preg_replace('/<[^>]*>/', '', pms_br2nl(html_entity_decode($str, ENT_COMPAT, 'UTF-8')));
    $str = preg_replace('/\s/', ' ', $str);
    $str = preg_replace('/\s\s+/', ' ', $str);

    return trim($str);
}
/***********************************************************************
 * pms_wrapSentence() wraps a string around searched terms
 *
 * @param string $haystack      string to wrap
 * @param string $needle        searched string
 * @param integer $numWords     number of words to keep around the searched terms
 * @param integer $numOccur     number of parts of the input string to return
 *
 * @return string
 *
 */
function pms_wrapSentence($haystack, $needle, $numWords = 5, $numOccur = 3)
{
    $search = pms_format_search($needle);
    $needle = $search[0];
    $needles = $search[1];

    $haystack = pms_rip_tags($haystack);
    $words = preg_split('/\s+/', $haystack);
    $words_format = preg_split('/\s+/', pms_format_string($haystack));

    $found_words = array();
    foreach($needles as $i => $ndl)
        $found_words += preg_grep('/^.*\''.$ndl.'.*|^'.$ndl.'.*/', $words_format);

    $found_pos = array_keys($found_words);
    $found_count = count($found_pos);
    $count_words = count($words);

    if($found_count > 0){
        if($found_count < $numOccur) $numOccur = $found_count;
        $out = '';
        $start_next = null;
        $pre_start_next = null;
        for($i = 0; $i < $numOccur; $i++){
            $pos = $found_pos[$i];
            $length = null;
            $post_end = null;
            $pre_start = null;

            if(is_null($start_next)) $start = ($pos - $numWords > 0) ? $pos - $numWords : 0;
            else $start = $start_next;

            if(is_null($pre_start_next)) $pre_start = ($start > 0) ? ' ... ' : '';
            else $pre_start = $pre_start_next;

            $start_next = null;
            $pre_start_next = null;

            if(($i+1) < $numOccur){
                $pos_next = $found_pos[$i+1];
                if(($pos_next-$pos-1) <= $numWords){
                    $length = $pos-$start+1;
                    $start_next = $pos+1;
                    $post_end = '';
                    $pre_start_next = ' ';
                }elseif(($pos_next-$pos-1) < ($numWords*2)){
                    $length = ($pos_next-$numWords > 0) ? $pos_next-$numWords-$pos : 0;
                    $post_end = '';
                    $pre_start_next = ' ';
                }elseif(($pos_next-$pos-1) == ($numWords*2)){
                    $post_end = '';
                    $pre_start_next = ' ';
                }else{
                    $post_end = ' ... ';
                    $pre_start_next = '';
                }
            }

            if(is_null($length)) $length = (($pos + ($numWords + 1) < $count_words) ? $pos + ($numWords + 1) : $count_words) - $start;
            $slice = array_slice($words, $start, $length);

            if(is_null($post_end)) $post_end = ($pos + ($numWords + 1) < $count_words) ? ' ... ' : '';

            $out .= $pre_start.implode(' ', $slice).$post_end;
        }
        return pms_highlight($out, $needle);
    }else return false;
}
/***********************************************************************
 * pms_htmlaccents() replaces the accents of a string by html entities
 *
 * @param string $text      string to format
 * @param inetegr $flags    htmlentities() function flags
 * @param string $charset   character encoding used during the conversion
 *
 * @return string
 *
 */
function pms_htmlaccents($text, $flags = ENT_NOQUOTES, $charset = 'UTF-8')
{
    $text = htmlentities($text, $flags, $charset);
    $text = htmlspecialchars_decode($text);
    return $text;
}
/***********************************************************************
 * pms_sendMail() format and send an e-mail
 *
 * @param string $recipient_email
 * @param string $recipient_name
 * @param string $subject
 * @param string $content       mail body
 * @param string $reply_email   email used as recipient by the action "reply"
 * @param string $reply_name    name used as recipient by the action "reply"
 * @param string $from_email    sender email
 * @param string $from_name     sender name
 * @param array $attachements   files paths
 * @param string $emails_copy   other emails addresses separated by ";"
 *
 * @return boolean
 *
 */
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

function pms_sendMail($recipient_email, $recipient_name, $subject, $content, $reply_email = '', $reply_name = '', $from_email = '', $from_name = '', $attachements = array(), $emails_copy = '')
{
    require_once(SYSBASE.'common/phpmailer/src/PHPMailer.php');
    require_once(SYSBASE.'common/phpmailer/src/SMTP.php');
    require_once(SYSBASE.'common/phpmailer/src/Exception.php');

    $mail = new PHPMailer(true);
    $mail->CharSet = 'UTF-8';

    if(PMS_USE_SMTP == 1){
        $mail->IsSMTP();
        $mail->SMTPDebug = 0;
        $mail->Host = PMS_SMTP_HOST;
        $mail->SMTPSecure = PMS_SMTP_SECURITY;
        if(PMS_SMTP_AUTH == 1){
            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            $mail->SMTPAuth = true;
            $mail->Username = PMS_SMTP_USER;
            $mail->Password = PMS_SMTP_PASS;
        }
        $mail->Port = PMS_SMTP_PORT;
    }

    $default_email = (PMS_SENDER_EMAIL != '') ? PMS_SENDER_EMAIL : 'noreply@'.substr($_SERVER['HTTP_HOST'], strpos($_SERVER['HTTP_HOST'], '.')+1);
    $default_name = (PMS_SENDER_NAME != '') ? PMS_SENDER_NAME : PMS_SITE_TITLE;

    if($reply_email == '') $reply_email = $default_email;
    if($reply_name == '') $reply_name = $default_name;

    if($from_email == '') $from_email = $default_email;
    if($from_name == '') $from_name = $default_name;

    $body = '<div style="width:740px;">
                <img src="cid:header-mail" alt="">
            </div>
            <div style="width:700px;padding:20px;text-align:left;font-size:13px;color:#333333;">'.pms_htmlaccents($content).'</div>'."\n\n";

    try {
        $mail->setFrom(htmlspecialchars_decode($from_email, ENT_QUOTES), htmlspecialchars_decode($from_name, ENT_QUOTES));
        $mail->AddReplyTo(htmlspecialchars_decode($reply_email, ENT_QUOTES), htmlspecialchars_decode($reply_name, ENT_QUOTES));
        $mail->Subject = htmlspecialchars_decode($subject, ENT_QUOTES);
        $mail->AddAddress(htmlspecialchars_decode($recipient_email, ENT_QUOTES), htmlspecialchars_decode($recipient_name, ENT_QUOTES));
        if($emails_copy != ''){
            $emails_copy = explode(';', $emails_copy);
            foreach($emails_copy as $email_copy){
                if($email_copy != '') $mail->AddCC($email_copy, '');
            }
        }
        $mail->AddEmbeddedImage(SYSBASE.'templates/'.PMS_TEMPLATE.'/images/header-mail.png', 'header-mail', 'header-mail.png');
        $mail->MsgHTML($body);
        $mail->AltBody = pms_rip_tags($content);

        if(is_array($attachements) && !empty($attachements)){
            foreach($attachements as $path){
                if(is_file($path)){
                    $name = substr($path, strrpos($path, '/')+1);
                    $mime = pms_getFileMimeType($path);
                    $mail->AddAttachment($path, $name, 'base64', $mime);
                }
            }
        }

		return $mail->Send();

    }catch(Exception $e){
        echo $e->errorMessage();
        return false;
    }catch(Exception $e){
        echo $e->getMessage();
        return false;
    }
}
/***********************************************************************
 * pms_genPass() generates a random password
 *
 * @param integer $len password length
 *
 * @return string
 *
 */
function pms_genPass($len = 8)
{
    $pass = '';

    $chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

    mt_srand((double)microtime()*1000000);

    while(strlen($pass) < $len) $pass .= $chars[mt_rand(0, strlen($chars)-1)];

    return $pass;
}
/***********************************************************************
 * pms_getMail() gets the HTML content of an email
 *
 * @param PDOStatement $pms_db  database connection ressource
 * @param array $name email name
 * @param array $vars variables
 *
 * @return string
 */
function pms_getMail($pms_db, $name, $vars = array()){

    $result = $pms_db->query('SELECT * FROM pm_email_content WHERE name = '.$pms_db->quote($name).' AND lang = '.PMS_LANG_ID);
    if($result !== false && $pms_db->last_row_count() > 0){
        $row = $result->fetch();
        $content = $row['content'];

        foreach($vars as $key => $val)
            $content = str_replace($key, $val, $content);

        return array('subject' => $row['subject'], 'content' => $content);

    }else return false;
}
/***********************************************************************
 * pms_get_distance() gets the distance between two geographical points
 *
 * @param integer $lat1     latitude of the 1st point
 * @param integer $lng1     longitude of the 1st point
 * @param integer $lat2     latitude of the 2nd point
 * @param integer $lng2     longitude of the 2nd point
 *
 * @return float distance in meters
 */
function pms_get_distance($lat1, $lng1, $lat2, $lng2)
{
    $earth_radius = 6378137; // Earth beam = 6378km
    $rlo1 = deg2rad($lng1);
    $rla1 = deg2rad($lat1);
    $rlo2 = deg2rad($lng2);
    $rla2 = deg2rad($lat2);
    $dlo = ($rlo2 - $rlo1) / 2;
    $dla = ($rla2 - $rla1) / 2;
    $a = (sin($dla) * sin($dla)) + cos($rla1) * cos($rla2) * (sin($dlo) * sin($dlo));
    $d = 2 * atan2(sqrt($a), sqrt(1 - $a));
    return ($earth_radius * $d);
}
/***********************************************************************
 * pms_get_coords() gets the coordinates of a given address
 *
 * @param string $address
 *
 * @return array latitude and longitude
 */
function pms_get_coords($address)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address='.urlencode($address));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    $result = curl_exec($ch);
    $phpresult = json_decode($result);
    if(is_array($phpresult->results) && sizeof($phpresult->results) > 0){
        $lat = $phpresult->results[0]->geometry->location->lat;
        $lng = $phpresult->results[0]->geometry->location->lng;
    }
    if(isset($lat) && isset($lng)) return array($lat, $lng); else return false;
}
/***********************************************************************
 * pms_check_URI() checks the relevance of the supplied URI
 *
 * @param string $uri
 *
 * @return void
 */
function pms_check_URI($uri)
{
    if($_SERVER['REQUEST_URI'] != $uri){
        header('Status: 301 Moved Permanently', false, 301);
        header('Location: '.$uri);
        exit;
    }
}
/***********************************************************************
 * pms_err404() displays a 404 error
 *
 * @param string $url url of the error 404 page
 *
 * @return void
 */
function pms_err404($url = URL_404)
{
    header('HTTP/1.0 404 Not Found');
    header('Location: '.$url);
    exit();
}
/***********************************************************************
 * pms_get_token() generates a unique token to authenticate the admin user
 *
 * @param string $name name of the token (page name)
 *
 * @return string
 */
function pms_get_token($name)
{
    $token = uniqid(rand(), true);
    $_SESSION[$name.'_token'] = $token;
    $_SESSION[$name.'_token_time'] = time();
    return $token;
}
/***********************************************************************
 * pms_check_token() checks the validity of the token
 *
 * @param string $referer   absolute path (web root) of the current page
 * @param string $name      name of the token (page name)
 * @param string $type      action used by the form (get or post)
 *
 * @return boolean
 */
function pms_check_token($referer, $name, $type)
{
    if(isset($_SESSION[$name.'_token']) && isset($_SESSION[$name.'_token_time'])
    && (($type == 'post' && isset($_POST['csrf_token']) && $_SESSION[$name.'_token'] == $_POST['csrf_token'])
    XOR ($type == 'get' && isset($_GET['csrf_token']) && $_SESSION[$name.'_token'] == $_GET['csrf_token']))
    && ($_SESSION[$name.'_token_time'] >= (time()-1800))
    && isset($_SERVER['HTTP_REFERER']) && (strstr($_SERVER['HTTP_REFERER'], $referer) !== false))
        return true;
    else
        return false;
}
/***********************************************************************
 * pms_is_rwx() checks if the file/folder exists and is readable, writable, executable for all users
 *
 * @param string $file absolute path of the file
 *
 * @return boolean
 */
function pms_is_rwx($file)
{
    return (file_exists($file) && substr(sprintf('%o', fileperms($file)), -3) === '777');
}
/***********************************************************************
 * pms_getUrl() returns the current full URL
 *
 * @param boolean $host_only return only the protocol followed by the domain name
 *
 * @return string
 */
function pms_getUrl($host_only = false)
{
    $protocol = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != '' && $_SERVER['HTTPS'] != 'off') ? 'https' : 'http';
    $url = $protocol.'://'.$_SERVER['HTTP_HOST'];
    if($host_only === false) $url .= $_SERVER['REQUEST_URI'];
    return $url;
}
/***********************************************************************
 * pms_checkReferer() checks if the URL which referred the user agent to the current page comes from the same domain
 *
 * @return boolean
 */
function pms_checkReferer()
{
    return (isset($_SERVER['HTTP_REFERER']) && strstr($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) !== false);
}
/***********************************************************************
 * pms_getWidgets() return the widgets of a page for the specified position
 *
 * @param string $pos       position of the widget
 * @param integer $pms_page_id  ID of the current page
 *
 * @return array
 */
function pms_getWidgets($pos, $pms_page_id){
    global $widgets;

    $myWidgets = array();
    if(isset($widgets[$pos])){
        foreach($widgets[$pos] as $widget){
            if($widget['allpages'] == 1 || ($widget['pages'] != '' && in_array($pms_page_id, explode(',', $widget['pages']))))
                $myWidgets[$pos][] = $widget;
        }
    }
    return $myWidgets;
}
/***********************************************************************
 * pms_displayWidgets() displays the widget for a page and the specified position
 *
 * @param string $pos       position of the widget
 * @param integer $pms_page_id  ID of the current page
 *
 * @return void
 */
function pms_displayWidgets($pos, $pms_page_id){
    global $pms_db;
    global $pms_langs;
    global $pms_currencies;
    global $pms_pages;
    global $page;
    global $pms_article_id;
    global $pms_menus;
    global $pms_sys_pages;
    global $pms_texts;
    global $pms_javascripts;
    global $pms_stylesheets;

    $widgets = pms_getWidgets($pos, $pms_page_id);

    if(!empty($widgets)){
        echo '<div class="widget-'.$pos.'">';
        foreach($widgets[$pos] as $widget){
            echo '<div id="widget-'.$widget['id'].'" class="widget';
            if($widget['class'] != '') echo ' '.$widget['class'];
            echo '">';
            if($widget['showtitle'] == 1) echo '<div class="widget-title">'.$widget['title'].'</div>';
            echo '<div class="widget-content">';
            $path = SYSBASE.'templates/'.PMS_TEMPLATE.'/widgets/';
            if($widget['type'] != '' && is_file($path.$widget['type'].'.php'))
                include($path.$widget['type'].'.php');
            else
                echo $widget['content'];
            echo '</div></div>';
        }
        echo '</div>';
    }
}
/***********************************************************************
 * pms_formatPrice() formats a number with spaces, dots, commas
 *
 * @param float     $price price to format
 * @param string    $currency currency sign
 *
 * @return float
 */
function pms_formatPrice($price, $currency = PMS_CURRENCY_SIGN)
{
    if(function_exists('numfmt_format_currency')){
        $fmt = new \NumberFormatter(PMS_LOCALE, \NumberFormatter::CURRENCY);
        return $fmt->formatCurrency($price, PMS_CURRENCY_CODE);
    }elseif(function_exists('money_format')){
        $fmt = (PMS_CURRENCY_POS == 'after') ? '%!n '.$currency : $currency.' %!n';
        return preg_replace('/([,\.]00(\s)?('.PMS_CURRENCY_SIGN.')?)$/', '$2$3', money_format($fmt, $price));
    }else
        return $currency.str_replace('.00', '', number_format($price, 2, '.', ','));
}
/***********************************************************************
 * pms_getFromTemplate() builds the path of the file from the correct template
 *
 * @param string $path      path of the file from the template folder
 * @param boolean $docbase  base of the path: true = from the web root, false = from the server root
 *
 * @return string
 */
function pms_getFromTemplate($path, $docbase = true)
{
    $base = $docbase ? DOCBASE : SYSBASE;
    $default_path = 'templates/default/'.$path;
    if(PMS_TEMPLATE == 'default')
        return $base.$default_path;
    else{
        $template_path = 'templates/'.PMS_TEMPLATE.'/'.$path;
        if(is_file(SYSBASE.$template_path))
            return $base.$template_path;
        else{
            if(is_file(SYSBASE.$default_path))
                return $base.$default_path;
            else
                return 'File not found: '.$base.$template_path;
        }
    }
}
/***********************************************************************
 * pms_get_top_nav_id() gets first level nav id
 *
 * @param string $menu current menu
 *
 * @return integer
 */
function pms_get_top_nav_id($menu)
{
    global $pms_article_id;
    global $pms_page_id;

    $page_nav_id = 0;
    $article_nav_id = 0;
    foreach($menu as $nav_id => $nav){
        $item_id = $nav['id_item'];
        $nav_type = $nav['item_type'];

        if($nav_type == 'page' && $pms_page_id == $item_id) $page_nav_id = $nav_id;
        if($pms_article_id > 0 && $nav_type == 'article' && $pms_article_id == $item_id) $article_nav_id = $nav_id;
    }

    $curr_nav_id = ($article_nav_id > 0) ? $article_nav_id : $page_nav_id;
    $top_nav_id = $curr_nav_id;

    if($curr_nav_id > 0){
        $parent_id = $menu[$curr_nav_id]['id_parent'];

        while(!empty($parent_id) && isset($menu[$parent_id])){
            $top_nav_id = $parent_id;
            $parent_id = $menu[$parent_id]['id_parent'];
        }
    }
    return $top_nav_id;
}
/***********************************************************************
 * pms_has_child_nav() returns true if the current nav item has a submenu
 *
 * @param integer $id_nav current nav id
 * @param array $menu current menu
 *
 * @return boolean
 */
function pms_has_child_nav($id_nav, $menu)
{
    foreach($menu as $nav_id => $nav){
        if($nav_id != $id_nav && $nav['id_parent'] == $id_nav) return true;
    }
    return false;
}
/***********************************************************************
 * pms_get_nav_url() gets the URL of the current nav item
 *
 * @param array $nav current nav item
 *
 * @return string
 */
function pms_get_nav_url($nav)
{
    global $pms_pages;
    global $articles;
    switch($nav['item_type']){
        case 'page':
            $href = DOCBASE.$pms_pages[$nav['id_item']]['alias'];
            break;
        case 'article':
            $href = DOCBASE.$articles[$nav['id_item']]['alias'];
            break;
        case 'url':
            $href = $nav['url'];
            break;
        default:
            $href = '#';
            break;
    }
    return $href;
}
/***********************************************************************
 * pms_get_translation() gets the translation of an entry in the admin language file
 *
 * @param string $entry entry name which indexes the translated value
 *
 * @return string
 */
function pms_get_translation($entry)
{
    global $pms_texts;
    $value = $entry;
    if(strpos($entry, '[') !== false){
        if(preg_match_all('/\[(\w+)\]/', $entry, $matches) > 0){
            $matches = $matches[1];
            foreach($matches as $entry){
                if(isset($pms_texts[$entry])) $value = str_replace('['.$entry.']', $pms_texts[$entry], $value);
            }
        }
    }
    return $value;
}
/***********************************************************************
 * pms_gm_strtotime() converts a date to GMT timestamp
 *
 * @param string $date date to convert
 *
 * @return integer
 */
function pms_gm_strtotime($date)
{
    date_default_timezone_set('UTC');
    $time = strtotime($date.' GMT');
    date_default_timezone_set(PMS_TIME_ZONE);
    return $time;
}
/***********************************************************************
 * pms_gmtime() returns the current GMT timestamp
 *
 * @return integer
 */
function pms_gmtime()
{
    date_default_timezone_set('UTC');
    $time = time();
    date_default_timezone_set(PMS_TIME_ZONE);
    return $time;
}
/***********************************************************************
 * pms_getAltText() return the plural or singular variation of a text
 *
 * @param string $singular text if singular
 * @param string $plural text if plural
 * @param integer $value reference value
 * @param string $mode case of the first letter (lc or uc)
 *
 * @return string
 */
function pms_getAltText($singular, $plural, $value, $mode = 'lc')
{
    $mode = ($mode == 'lc') ? MB_CASE_LOWER : MB_CASE_TITLE;
    $string = ($value > 1) ? $plural : $singular;
    return mb_convert_case($string, $mode, 'UTF-8');
}
/***********************************************************************
 * pms_getInitials() return the first letter of each word
 *
 * @param string $input
 * @param string $mode case of the initials (lc or uc)
 *
 * @return string
 */
function pms_getInitials($input, $limit = 3, $mode = 'uc')
{
    $wds = explode(' ', $input);
    $nb_wds = count($wds);
    $initials = '';
    foreach($wds as $i => $wd){
        if($i+1 > $limit) break;
        $initials .= substr($wd, 0, 1);
    }
    $mode = ($mode == 'uc') ? MB_CASE_UPPER : MB_CASE_LOWER;
    return mb_convert_case($initials, $mode, 'UTF-8');
}
/**
 * Strips all array elements which value strictly equals to null
 *
 * @param array $array
 *
 * @return array
 */
function array_filter_null(array $array)
{
    return array_filter($array, function ($var) {
        return null !== $var;
    });
}
