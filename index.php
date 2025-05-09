<?php
require('common/lib.php');
require('common/define.php');

// 🚨 Maintenance Mode Check
if (PMS_MAINTENANCE_MODE == 1 && (!isset($_SESSION['user']) || !in_array($_SESSION['user']['type'], ['administrator', 'manager']))) {
    header('HTTP/1.1 503 Service Temporarily Unavailable');
    require(SYSBASE . 'templates/' . PMS_TEMPLATE . '/maintenance.php');
    exit;
}

// 🔄 Parse URI
$uri = explode('/', REQUEST_URI);
$ishome = false;
$page_alias = '';
$article_alias = '';
$page = null;
$article = null;
$pms_page_id = 0;
$pms_article_id = 0;

// 🔍 Determine if it's home or internal
if ((PMS_LANG_ENABLED && count($uri) == 1) || (!PMS_LANG_ENABLED && REQUEST_URI == '')) {
    $ishome = true;
} else {
    $i = PMS_LANG_ENABLED ? 1 : 0;
    $page_alias = trim(PMS_LANG_ALIAS . ($uri[$i] ?? ''), '/\\');
    $article_alias = $uri[$i + 1] ?? '';
    if (count($uri) > $i + 2) pms_err404();
}

// 🔍 Match articles
foreach ($articles as $id => $row) {
    if ($article_alias !== '' && $article_alias === basename($row['alias'])) {
        $pms_article_id = $row['id'];
        $article = $row;
        break;
    }
}

// 🔍 Match pages
$found = false;
foreach ($pms_pages as $row) {
    $alias_match = $ishome ? ($row['home'] == 1) : ($row['alias'] != '' && $page_alias == $row['alias']);

    if ($alias_match) {
        if ($article_alias == '' && $row['currequest'] !== REQUEST_URI) {
            continue; // Don't match wrong URLs
        }
        $pms_page_id = $row['id'];
        $page = $row;
        $found = true;
        break;
    }
}

if (!$found) {
    pms_err404();
}

// 🔒 Check if models are missing
if ($article_alias && empty($page['article_model'])) pms_err404();
if (!$article_alias && empty($page['page_model'])) pms_err404();

// ✅ Determine which model to load
$page_model = SYSBASE . 'templates/' . PMS_TEMPLATE . '/models/' . str_replace('_', '/', $article_alias ? $page['article_model'] : $page['page_model']) . '.php';

if (!is_file($page_model)) pms_err404();

// 🔗 Breadcrumbs (optional feature)
$breadcrumbs = [];
$id_parent = $page['id_parent'];
while (isset($pms_parents[$id_parent])) {
    if ($id_parent > 0 && (!isset($pms_homepage) || $id_parent != $pms_homepage['id'])) {
        $breadcrumbs[] = $id_parent;
        $id_parent = $pms_pages[$id_parent]['id_parent'];
    } else {
        break;
    }
}
$breadcrumbs = array_reverse($breadcrumbs);

// ✅ Include the page model
include($page_model);

// ✅ Footer
require(SYSBASE . 'templates/' . PMS_TEMPLATE . '/common/footer.php');

// ✅ Output buffering flush
if (ob_get_level() > 0) ob_flush();
