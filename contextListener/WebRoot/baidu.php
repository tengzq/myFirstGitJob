<?php
$urls = array(
    'http://www.wanjinxiansheng.com/',
    'http://www.wanjinxiansheng.com/_project/goProjectList',
    'http://www.wanjinxiansheng.com/enjoylife',
    'http://www.wanjinxiansheng.com/register/loanPage',
    'http://www.wanjinxiansheng.com/zfarticle/safety?PROGRAM_ID=pg_baozhang',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=45',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=41',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=44',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=43',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=47',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=46',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=15',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=48',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=33',
    'http://www.wanjinxiansheng.com/zfarticle/footFind?ARTICLE_ID=49',
    'http://www.wanjinxiansheng.com/zfarticle/safety?PROGRAM_ID=pg_bangzhu',
    'http://www.wanjinxiansheng.com/login_toZfLogin',
    'http://www.wanjinxiansheng.com/_project/goDetails.do?ID=98daeeeabcaf416db8a4b06cca34ba5e',
    'http://www.wanjinxiansheng.com/_project/goDetails.do?ID=e37a78b756224ff7995d96c63774ce94',
    'http://www.wanjinxiansheng.com/_project/goDetails.do?ID=f25f9c3939754b10bf57505e4aa525a5',
    'http://www.wanjinxiansheng.com/_project/goDetails.do?ID=b756f6cd10464d86add317d66985c52d'
);
$api = 'http://data.zz.baidu.com/urls?site=www.wanjinxiansheng.com&token=uqcFpLWe2Nt11bUb';
$ch = curl_init();
$options =  array(
    CURLOPT_URL => $api,
    CURLOPT_POST => true,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POSTFIELDS => implode("\n", $urls),
    CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
);
curl_setopt_array($ch, $options);
$result = curl_exec($ch);
echo $result;
?>