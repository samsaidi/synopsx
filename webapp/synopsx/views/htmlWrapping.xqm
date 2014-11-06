module namespace synopsx.views.htmlWrapping = 'synopsx.views.htmlWrapping';
declare default function namespace 'synopsx.views.htmlWrapping'; 



declare function render($content, $options, $layout){
	let $tmpl := fn:doc($layout('layout'))
  (: a supprimer après passage à xslt2:)
  let $contentWrap := <xml>{$content('items')}</xml>
	return $tmpl update (
		replace value of node .//html:div[@id='content'] with xslt:transform($contentWrap,'http://localhost:8984/static/xsl/tei2html5.xsl',$options),
    replace value of node .//html:title with $content('title')
	)
};

declare function to-html($items){
	for $item in $items
	let $name := fn:local-name($item)
	let $tmpl := fn:doc($name || "_tmpl.html")
	return $tmpl

};