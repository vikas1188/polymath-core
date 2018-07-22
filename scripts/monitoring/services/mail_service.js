var aws  = require('aws-sdk');
let read = require('read-yaml');
let config = read.sync('config.yml');

var ses = new aws.SES({
       accessKeyId: config.aws_email_settings.aws_access_key_id,
       secretAccessKey: config.aws_email_settings.aws_secret_access_key,
       region: config.aws_email_settings.region,
});

export function send_alert_mail(message, cause) {

    var subject = 'alert-monitoring-poly-usd-oracle';

    var mailBody = `<!DOCTYPE html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="referrer" content="origin">
            
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            
        <style type="text/css">
            p{
                margin:10px 0;
                padding:0;
            }
            table{
                border-collapse:collapse;
            }
            h1,h2,h3,h4,h5,h6{
                display:block;
                margin:0;
                padding:0;
            }
            img,a img{
                border:0;
                height:auto;
                outline:none;
                text-decoration:none;
            }
            body,#bodyTable,#bodyCell{
                height:100%;
                margin:0;
                padding:0;
                width:100%;
            }
            .mcnPreviewText{
                display:none !important;
            }
            #outlook a{
                padding:0;
            }
            img{
                -ms-interpolation-mode:bicubic;
            }
            table{
                mso-table-lspace:0pt;
                mso-table-rspace:0pt;
            }
            .ReadMsgBody{
                width:100%;
            }
            .ExternalClass{
                width:100%;
            }
            p,a,li,td,blockquote{
                mso-line-height-rule:exactly;
            }
            a[href^=tel],a[href^=sms]{
                color:inherit;
                cursor:default;
                text-decoration:none;
            }
            p,a,li,td,body,table,blockquote{
                -ms-text-size-adjust:100%;
                -webkit-text-size-adjust:100%;
            }
            .ExternalClass,.ExternalClass p,.ExternalClass td,.ExternalClass div,.ExternalClass span,.ExternalClass font{
                line-height:100%;
            }
            a[x-apple-data-detectors]{
                color:inherit !important;
                text-decoration:none !important;
                font-size:inherit !important;
                font-family:inherit !important;
                font-weight:inherit !important;
                line-height:inherit !important;
            }
            #bodyCell{
                padding:10px;
            }
            .templateContainer{
                max-width:600px !important;
            }
            a.mcnButton{
                display:block;
            }
            .mcnImage,.mcnRetinaImage{
                vertical-align:bottom;
            }
            .mcnTextContent{
                word-break:break-word;
            }
            .mcnTextContent img{
                height:auto !important;
            }
            .mcnDividerBlock{
                table-layout:fixed !important;
            }
            body,#bodyTable{
                background-color:#FAFAFA;
            }
            #bodyCell{
                border-top:0;
            }
            .templateContainer{
                border:0;
            }
            h1{
                color:#202020;
                font-family:Helvetica;
                font-size:26px;
                font-style:normal;
                font-weight:bold;
                line-height:125%;
                letter-spacing:normal;
                text-align:left;
            }
            h2{
                color:#202020;
                font-family:Helvetica;
                font-size:22px;
                font-style:normal;
                font-weight:bold;
                line-height:125%;
                letter-spacing:normal;
                text-align:left;
            }
            h3{
                color:#202020;
                font-family:Helvetica;
                font-size:20px;
                font-style:normal;
                font-weight:bold;
                line-height:125%;
                letter-spacing:normal;
                text-align:left;
            }
            h4{
                color:#202020;
                font-family:Helvetica;
                font-size:18px;
                font-style:normal;
                font-weight:bold;
                line-height:125%;
                letter-spacing:normal;
                text-align:left;
            }
            #templatePreheader{
                background-color:#FAFAFA;
                background-image:none;
                background-repeat:no-repeat;
                background-position:center;
                background-size:cover;
                border-top:0;
                border-bottom:0;
                padding-top:9px;
                padding-bottom:9px;
            }
            #templatePreheader .mcnTextContent,#templatePreheader .mcnTextContent p{
                color:#656565;
                font-family:Helvetica;
                font-size:12px;
                line-height:150%;
                text-align:left;
            }
            #templatePreheader .mcnTextContent a,#templatePreheader .mcnTextContent p a{
                color:#656565;
                font-weight:normal;
                text-decoration:underline;
            }
            #templateHeader{
                background-color:#ffffff;
                background-image:none;
                background-repeat:no-repeat;
                background-position:top;
                background-size:cover;
                border-top:0;
                border-bottom:0;
                padding-top:9px;
                padding-bottom:0;
            }
            #templateHeader .mcnTextContent,#templateHeader .mcnTextContent p{
                color:#3f4b80;
                font-family:Helvetica;
                font-size:16px;
                line-height:150%;
                text-align:left;
            }
            #templateHeader .mcnTextContent a,#templateHeader .mcnTextContent p a{
                color:#2BAADF;
                font-weight:normal;
                text-decoration:underline;
            }
            #templateBody{
                background-color:#ffffff;
                background-image:none;
                background-repeat:no-repeat;
                background-position:top;
                background-size:cover;
                border-top:0;
                border-bottom:0;
                padding-top:55px;
                padding-bottom:0px;
            }
            #templateBody .mcnTextContent,#templateBody .mcnTextContent p{
                color:#404040;
                font-family:'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size:16px;
                line-height:150%;
                text-align:left;
            }
            #templateBody .mcnTextContent a,#templateBody .mcnTextContent p a{
                color:#2BAADF;
                font-weight:normal;
                text-decoration:underline;
            }
            #templateColumns{
                background-color:#ffffff;
                background-image:url("https://gallery.mailchimp.com/1123326c9027e961f6ac1190c/images/994f65b1-e2de-4799-87c4-4649759b249f.png");
                background-repeat:no-repeat;
                background-position:top;
                background-size:cover;
                border-top:0;
                border-bottom:2px none #EAEAEA;
                padding-top:15px;
                padding-bottom:15px;
            }
            #templateColumns .columnContainer .mcnTextContent,#templateColumns .columnContainer .mcnTextContent p{
                color:#ffffff;
                font-family:'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size:14px;
                line-height:150%;
                text-align:center;
            }
            #templateColumns .columnContainer .mcnTextContent a,#templateColumns .columnContainer .mcnTextContent p a{
                color:#2BAADF;
                font-weight:normal;
                text-decoration:underline;
            }
            #templateFooter{
                background-color:#fafafa;
                background-image:none;
                background-repeat:no-repeat;
                background-position:center;
                background-size:cover;
                border-top:0;
                border-bottom:0;
                padding-top:9px;
                padding-bottom:9px;
            }
            #templateFooter .mcnTextContent,#templateFooter .mcnTextContent p{
                color:#656565;
                font-family:'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
                font-size:12px;
                line-height:150%;
                text-align:center;
            }
            #templateFooter .mcnTextContent a,#templateFooter .mcnTextContent p a{
                color:#656565;
                font-weight:normal;
                text-decoration:underline;
            }
        @media only screen and (min-width:768px){
            .templateContainer{
                width:600px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            body,table,td,p,a,li,blockquote{
                -webkit-text-size-adjust:none !important;
            }
    
    }	@media only screen and (max-width: 480px){
            body{
                width:100% !important;
                min-width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #bodyCell{
                padding-top:10px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .columnWrapper{
                max-width:100% !important;
                width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnRetinaImage{
                max-width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImage{
                width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnCartContainer,.mcnCaptionTopContent,.mcnRecContentContainer,.mcnCaptionBottomContent,.mcnTextContentContainer,.mcnBoxedTextContentContainer,.mcnImageGroupContentContainer,.mcnCaptionLeftTextContentContainer,.mcnCaptionRightTextContentContainer,.mcnCaptionLeftImageContentContainer,.mcnCaptionRightImageContentContainer,.mcnImageCardLeftTextContentContainer,.mcnImageCardRightTextContentContainer,.mcnImageCardLeftImageContentContainer,.mcnImageCardRightImageContentContainer{
                max-width:100% !important;
                width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnBoxedTextContentContainer{
                min-width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageGroupContent{
                padding:9px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnCaptionLeftContentOuter .mcnTextContent,.mcnCaptionRightContentOuter .mcnTextContent{
                padding-top:9px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageCardTopImageContent,.mcnCaptionBottomContent:last-child .mcnCaptionBottomImageContent,.mcnCaptionBlockInner .mcnCaptionTopContent:last-child .mcnTextContent{
                padding-top:18px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageCardBottomImageContent{
                padding-bottom:9px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageGroupBlockInner{
                padding-top:0 !important;
                padding-bottom:0 !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageGroupBlockOuter{
                padding-top:9px !important;
                padding-bottom:9px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnTextContent,.mcnBoxedTextContentColumn{
                padding-right:18px !important;
                padding-left:18px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnImageCardLeftImageContent,.mcnImageCardRightImageContent{
                padding-right:18px !important;
                padding-bottom:0 !important;
                padding-left:18px !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcpreview-image-uploader{
                display:none !important;
                width:100% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            h1{
                font-size:22px !important;
                line-height:125% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            h2{
                font-size:20px !important;
                line-height:125% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            h3{
                font-size:18px !important;
                line-height:125% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            h4{
                font-size:16px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            .mcnBoxedTextContentContainer .mcnTextContent,.mcnBoxedTextContentContainer .mcnTextContent p{
                font-size:14px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templatePreheader{
                display:block !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templatePreheader .mcnTextContent,#templatePreheader .mcnTextContent p{
                font-size:14px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templateHeader .mcnTextContent,#templateHeader .mcnTextContent p{
                font-size:16px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templateBody .mcnTextContent,#templateBody .mcnTextContent p{
                font-size:16px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templateColumns .columnContainer .mcnTextContent,#templateColumns .columnContainer .mcnTextContent p{
                font-size:16px !important;
                line-height:150% !important;
            }
    
    }	@media only screen and (max-width: 480px){
            #templateFooter .mcnTextContent,#templateFooter .mcnTextContent p{
                font-size:12px !important;
                line-height:150% !important;
            }
    
    }
    
    /*CSS*/
    
    /* latin-ext */
    @font-face {
      font-family: 'Lato';
      font-style: italic;
      font-weight: 400;
      src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v14/S6u8w4BMUTPHjxsAUi-qJCY.woff2) format('woff2');
      unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    /* latin */
    @font-face {
      font-family: 'Lato';
      font-style: italic;
      font-weight: 400;
      src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v14/S6u8w4BMUTPHjxsAXC-q.woff2) format('woff2');
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    /* latin-ext */
    @font-face {
      font-family: 'Lato';
      font-style: italic;
      font-weight: 700;
      src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v14/S6u_w4BMUTPHjxsI5wq_FQft1dw.woff2) format('woff2');
      unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    /* latin */
    @font-face {
      font-family: 'Lato';
      font-style: italic;
      font-weight: 700;
      src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v14/S6u_w4BMUTPHjxsI5wq_Gwft.woff2) format('woff2');
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    /* latin-ext */
    @font-face {
      font-family: 'Lato';
      font-style: normal;
      font-weight: 400;
      src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/S6uyw4BMUTPHjxAwXjeu.woff2) format('woff2');
      unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    /* latin */
    @font-face {
      font-family: 'Lato';
      font-style: normal;
      font-weight: 400;
      src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/S6uyw4BMUTPHjx4wXg.woff2) format('woff2');
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    /* latin-ext */
    @font-face {
      font-family: 'Lato';
      font-style: normal;
      font-weight: 700;
      src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwaPGR_p.woff2) format('woff2');
      unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    /* latin */
    @font-face {
      font-family: 'Lato';
      font-style: normal;
      font-weight: 700;
      src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ.woff2) format('woff2');
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    
    /* Archive bar styles for desktop (non-touch) devices.
    -------------------------------------------------------------- */
    html {border-top:40px solid #fff !important;}
    body#archivebody {margin:0; padding:0;}
    .invisible {visibility:hidden;}
    
    #awesomewrap {color:#444; font-size:14px; text-shadow:none; position:relative; z-index:999;}
    #awesomewrap * {margin:0; padding:0; font-family:"Helvetica Neue",Helvetica,Arial,Verdana,sans-serif;}
    #awesomewrap a {color:#444 !important; text-decoration:none;}
    #awesomewrap a:hover {color:#000 !important;}
    #awesomewrap li {list-style:none; display:inline;}
    #awesomewrap .float-r {float:right;}
    #awesomewrap .float-l {float:left;}
    
    #awesomebar, #awesomeshare {position:fixed; top:0; left:0; width:100%; height:40px; border-bottom:1px solid #ccc; background:rgb(244,244,244); background:rgba(244,244,244,.95); min-width:815px;}
    #awesomebar {-webkit-box-shadow: 0 2px 2px 0 rgba(0,0,0,.2); box-shadow: 0 2px 3px 0 rgba(0,0,0,.2);}
    #awesomebar.sub-active {background:#f4f4f4;}
    #awesomebar > li > a {display:block; font-weight:bold; float:left; line-height:40px; padding:0 20px; border-right:1px solid #ccc;}
    #awesomebar > li > a:hover {background:#fff;}
    #awesomebar > li.float-r > a {border-left:1px solid #ccc; border-right:none;}
    #awesomebar > li > ul {display:none;}
    #awesomebar > li.more {position:relative;}
    #awesomebar > li.more > a:after {content: ' '; display:block; float:right; position:relative; top:17px; left:5px; width:0; height:0; border-left:5px solid transparent; border-right:5px solid transparent; border-top:5px solid #444;}
    #awesomebar > li.more > a.is-active {background-color:#fff;}
    #awesomebar > li.more > a.is-active:after {border-top:none; border-bottom:5px solid #444;}
    #awesomebar > li > a.rss {background-image:url(//cdn-images.mailchimp.com/awesomebar-sprite.png); background-repeat:no-repeat; background-position:52px -153px; padding-right:40px;}
    
    #translate {position:absolute; top:41px; right:0; height:200px; width:198px; overflow:auto; max-height:200px; border:1px solid #ccc; border-top:none; background:rgb(244,244,244); background:rgba(244,244,244,.95); z-index:100;}
    #translate a {display:block; line-height:30px; border-top:1px solid #ccc; padding:0 10px 0 20px;}
    #translate a:hover {background:#fff;}
    
    #awesomeshare .btn {display:inline-block; border:1px solid #ccc; line-height:25px; background:#eee; border-radius:3px; margin:8px 18px 0 0; padding:0 15px;}
    #awesomeshare .btn:hover {border-color:#333; background-color:#888; color:#fff;}
    #awesomeshare {display:none; top:41px; line-height:40px; font-size:12px; text-align:left;}
    #awesomesocial {padding-left:14px; float:left; background:none;}
    #awesomeshare li {display:inline-block; border:1px solid #ccc; line-height:25px; border-radius:3px; margin:8px 5px 0 5px; overflow:hidden;}
    #awesomeshare li, #copyURL a {background-color:#eee; color:#444; font-size:13px; background-image: -webkit-linear-gradient(top, rgba(0,0,0,0), rgba(0,0,0,.15)); background-image: -moz-linear-gradient(top, rgba(0,0,0,0), rgba(0,0,0,.15)); background-image: linear-gradient(to bottom, rgba(0,0,0,0), rgba(0,0,0,.15));}
    
    #awesomeshare li a {display:inline; padding:0 10px;}
    #awesomeshare li b {display:inline-block; background:#fff; margin:0 -10px 0 10px; padding:0 15px; border-left:1px solid #ccc; color:#444;}
    #awesomeshare li a:last-child b {border-radius:0 2px 2px 0;}
    #awesomeshare li a.alt {padding:0;}
    #awesomeshare li a.alt b {margin:0 0 0 -4px;}
    
    #awesomeshare li:hover a {color:#fff !important;}
    #awesomeshare li.fbk a.fbk-like b, #awesomeshare li.fbk a.fbk-comment b {padding-right:36px; background-image:url(//cdn-images.mailchimp.com/awesomebar-sprite.png); background-repeat:no-repeat; background-position:right 1px;}
    #awesomeshare li.fbk a.fbk-comment b {background-position:right -79px;}
    #awesomeshare li.fbk:hover {border-color:#3a589d; background-color:#5472b7;}
    #awesomeshare li.fbk:hover b {border-color:#3a589d;}
    #awesomeshare li.fbk a:hover b {background-color:#e6ebf7;}
    #awesomeshare li.fbk a:hover.fbk-like b {background-position:right -39px;}
    #awesomeshare li.fbk a:hover.fbk-comment b {background-position:right -119px;}
    #awesomeshare li.twt:hover {border-color:#4c90c6; background-color:#61aed5;}
    #awesomeshare li.twt:hover b {border-color:#4c90c6;}
    #awesomeshare li.twt a:hover b {background:#e6f2f8; border-left-color:#4c90c6;}
    #awesomeshare li.ggl:hover {border-color:#c24531; background-color:#dd4c35;}
    #awesomeshare li.ggl:hover b {border-color:#d33c28;}
    #awesomeshare li.ggl a:hover b {background:#fae2de; border-left-color:#d33c28;}
    #awesomeshare li b i {display:none;}
    
    .copy-container {
        align-items: center;
        display: flex;
    }
    .copy-container label {
        white-space: nowrap;
    }
    #awesomeshare #zclipwrap {float:right; width:305px; position:relative;}
    #awesomeshare #zclipwrap label {font-weight:bold; color:#888; padding:0 5px;}
    #copyURL {display:inline-block; position:relative; border-radius:3px; border:1px solid transparent; line-height:25px; padding:0 0 0 10px; width:210px; height:25px; border-color:#ccc; background-color:#fff;}
    #copyURL input {border:none; width:150px; background:none;}
    #copyURL a {cursor:pointer; position:absolute; top:0; right:0; padding:0 10px; border-left:1px solid #ccc; font-size:13px; border-radius:0 2px 2px 0;}
    #copyURL:hover {border-color:#555;}
    #copyURL:hover a {background-color:#999; border-left-color:#555; color:#fff;}
    
    /* IE6 & 7 Hackery */
    #awesomeshare li {*zoom:1; *display:inline;}
    #awesomeshare {*height:auto; *padding-bottom:5px;}
    #awesomeshare .forwardtofriend, #social {*position:relative; *zoom:1; *display:inline; *float:none; *top:auto; *left:auto; *right:auto;}
    #awesomewrap {_display:none;}
    
    /* Facebook/Google+ Modals */
    #social-proxy {background:#fff; -webkit-box-shadow: 4px 4px 8px 2px rgba(0,0,0,.2); box-shadow: 4px 4px 8px 2px rgba(0,0,0,.2); padding-bottom:35px; z-index:1000;}
    #social-proxy_close {display:block; position:absolute; top:0; right:0; height:30px; width:32px; background:transparent url(//cdn-images.mailchimp.com/awesomebar-sprite.png) 0 -200px; text-indent:-9999px; outline:none; font-size:1px; }
    #social-proxy_close:hover {background-position:0 -240px;}
    
    
    </style><!--[if !mso]><!--></head> <body id="archivebody" style="height: 100%;margin: 0;padding: 0;width: 100%;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FAFAFA;">
            <center>
                <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="bodyTable" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;height: 100%;margin: 0;padding: 0;width: 100%;background-color: #FAFAFA;">
                    <tbody><tr>
                        <td align="center" valign="top" id="bodyCell" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;height: 100%;margin: 0;padding: 10px;width: 100%;border-top: 0;">
                            <!-- BEGIN TEMPLATE // -->
                            <!--[if (gte mso 9)|(IE)]>
                            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600" style="width:600px;">
                            <tr>
                            <td align="center" valign="top" width="600" style="width:600px;">
                            <![endif]-->
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="templateContainer" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;border: 0;max-width: 600px !important;">
                                <tbody><tr>
                                    <td valign="top" id="templatePreheader" style="background:#FAFAFA none no-repeat center/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FAFAFA;background-image: none;background-repeat: no-repeat;background-position: center;background-size: cover;border-top: 0;border-bottom: 0;padding-top: 9px;padding-bottom: 9px;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnTextBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnTextBlockOuter">
            <tr>
                <td valign="top" class="mcnTextBlockInner" style="padding-top: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    <!--[if mso]>
                    </td>
                    <![endif]-->
                    
                    <!--[if mso]>
                    </tr>
                    </table>
                    <![endif]-->
                </td>
            </tr>
        </tbody>
    </table></td>
                                </tr>
                                <tr>
                                    <td valign="top" id="templateHeader" style="background:#ffffff none no-repeat top/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #ffffff;background-image: none;background-repeat: no-repeat;background-position: top;background-size: cover;border-top: 0;border-bottom: 0;padding-top: 9px;padding-bottom: 0;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnImageBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnImageBlockOuter">
                <tr>
                    <td valign="top" style="padding: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" class="mcnImageBlockInner">
                        <table align="left" width="100%" border="0" cellpadding="0" cellspacing="0" class="mcnImageContentContainer" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <tbody><tr>
                                <td class="mcnImageContent" valign="top" style="padding-right: 9px;padding-left: 9px;padding-top: 0;padding-bottom: 0;text-align: center;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                    
                                        <a href="https://polymath.network/" title="" class="" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                            <img align="center" alt="" src="http://res.cloudinary.com/adityacloud/image/upload/v1531825967/polymath%20email%20templates/cf1beb1b-2b06-49be-ad5f-f1b83db76935.jpg" width="564" style="max-width: 1200px;padding-bottom: 0;display: inline !important;vertical-align: bottom;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;" class="mcnImage">
                                        </a>
                                    
                                </td>
                            </tr>
                        </tbody></table>
                    </td>
                </tr>
        </tbody>
    </table></td>
                                </tr>
                                <tr>
                                    <td valign="top" id="templateBody" style="background:#ffffff none no-repeat top/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #ffffff;background-image: none;background-repeat: no-repeat;background-position: top;background-size: cover;border-top: 0;border-bottom: 0;padding-top: 55px;padding-bottom: 0px;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnTextBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnTextBlockOuter">
            <tr>
                <td valign="top" class="mcnTextBlockInner" style="padding-top: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                      <!--[if mso]>
                    <table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
                    <tr>
                    <![endif]-->
                    
                    <!--[if mso]>
                    <td valign="top" width="600" style="width:600px;">
                    <![endif]-->
                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%" class="mcnTextContentContainer">
                        <tbody><tr>
                            
                            <td valign="top" class="mcnTextContent" style="padding: 0px 18px 9px;font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #404040;font-size: 16px;line-height: 150%;text-align: left;">
                            
                                <h2 style="text-align: center;display: block;margin: 0;padding: 0;color: #202020;font-family: Helvetica;font-size: 22px;font-style: normal;font-weight: bold;line-height: 125%;letter-spacing: normal;"><span style="font-size:24px"><span style="color:#3f4B80"><span style="font-family:lato,helvetica neue,helvetica,arial,sans-serif">Alert - ${message}</span></span></span></h2>
    
    <p style="font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;margin: 10px 0;padding: 0;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: #404040;font-size: 16px;line-height: 150%;text-align: left;"><br>
    <span style="font-size:16px">Hi satyam,</span></p>
    
    <p id="e6f7" name="e6f7" style="font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;margin: 10px 0;padding: 0;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;color: #404040;font-size: 16px;line-height: 150%;text-align: left;">${cause}<br>
    &nbsp;</p>
    
                            </td>
                        </tr>
                    </tbody></table>
                    <!--[if mso]>
                    </td>
                    <![endif]-->
                    
                    <!--[if mso]>
                    </tr>
                    </table>
                    <![endif]-->
                </td>
            </tr>
        </tbody>
    </table><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnTextBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnTextBlockOuter">
            <tr>
                <td valign="top" class="mcnTextBlockInner" style="padding-top: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                      <!--[if mso]>
                    <table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
                    <tr>
                    <![endif]-->
                    
                    <!--[if mso]>
                    <td valign="top" width="600" style="width:600px;">
                    <![endif]-->
                    <table align="left" border="0" cellpadding="0" cellspacing="0" style="max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" width="100%" class="mcnTextContentContainer">
                        <tbody><tr>
                            
                            <td valign="top" class="mcnTextContent" style="padding: 0px 18px 9px;color: #3E4B80;font-size: 16px;font-style: normal;font-weight: bold;text-align: center;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;font-family: &#39;Lato&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif;line-height: 150%;">
                            
                                <span style="font-size:20px"><strong>JOIN THE STAMPEDE</strong></span>
                            </td>
                        </tr>
                    </tbody></table>
                    <!--[if mso]>
                    </td>
                    <![endif]-->
                    
                    <!--[if mso]>
                    </tr>
                    </table>
                    <![endif]-->
                </td>
            </tr>
        </tbody>
    </table></td>
                                </tr>
                                <tr>
                                    <td valign="top" id="templateColumns" style="background:#ffffff url(&quot;https://gallery.mailchimp.com/1123326c9027e961f6ac1190c/images/994f65b1-e2de-4799-87c4-4649759b249f.png&quot;) no-repeat top/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #ffffff;background-image: url(https://gallery.mailchimp.com/1123326c9027e961f6ac1190c/images/994f65b1-e2de-4799-87c4-4649759b249f.png);background-repeat: no-repeat;background-position: top;background-size: cover;border-top: 0;border-bottom: 2px none #EAEAEA;padding-top: 15px;padding-bottom: 15px;">
                                        <!--[if (gte mso 9)|(IE)]>
                                        <table align="center" border="0" cellspacing="0" cellpadding="0" width="600" style="width:600px;">
                                        <tr>
                                        <td align="center" valign="top" width="200" style="width:200px;">
                                        <![endif]-->
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="200" class="columnWrapper" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                            <tbody><tr>
                                                <td valign="top" class="columnContainer" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnCaptionBlock" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnCaptionBlockOuter">
            <tr>
                <td class="mcnCaptionBlockInner" valign="top" style="padding: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    
    
    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnCaptionBottomContent" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody><tr>
            <td class="mcnCaptionBottomImageContent" align="center" valign="top" style="padding: 0 9px 9px 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
            
                
                <a href="https://polymath.network/resources/whitepaper" title="" class="" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                
    
                <img alt="Whitepaper" src="http://res.cloudinary.com/adityacloud/image/upload/v1531825966/polymath%20email%20templates/32be9133-908c-4f7a-a1c0-b5b6b612c297.png" width="64" style="max-width: 64px;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;vertical-align: bottom;" class="mcnImage">
                </a>
            
            </td>
        </tr>
        <tr>
            <td class="mcnTextContent" valign="top" style="padding: 0 9px 0 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #ffffff;font-family: &#39;Lato&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif;font-size: 14px;line-height: 150%;text-align: center;" width="164">
                <span style="font-size:16px"><strong>Read our whitepaper</strong></span>
            </td>
        </tr>
    </tbody></table>
    
    
    
    
    
                </td>
            </tr>
        </tbody>
    </table></td>
                                            </tr>
                                        </tbody></table>
                                        <!--[if (gte mso 9)|(IE)]>
                                        </td>
                                        <td align="center" valign="top" width="200" style="width:200px;">
                                        <![endif]-->
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="200" class="columnWrapper" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                            <tbody><tr>
                                                <td valign="top" class="columnContainer" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnCaptionBlock" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnCaptionBlockOuter">
            <tr>
                <td class="mcnCaptionBlockInner" valign="top" style="padding: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    
    
    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnCaptionBottomContent" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody><tr>
            <td class="mcnCaptionBottomImageContent" align="center" valign="top" style="padding: 0 9px 9px 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
            
                
                <a href="https://t.me/polymathnetwork" title="" class="" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                
    
                <img alt="Telegram" src="http://res.cloudinary.com/adityacloud/image/upload/v1531825966/polymath%20email%20templates/fc232ef3-77b1-44e9-b14e-f55ee6a11706.png" width="64" style="max-width: 64px;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;vertical-align: bottom;" class="mcnImage">
                </a>
            
            </td>
        </tr>
        <tr>
            <td class="mcnTextContent" valign="top" style="padding: 0 9px 0 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #ffffff;font-family: &#39;Lato&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif;font-size: 14px;line-height: 150%;text-align: center;" width="164">
                <span style="font-size:16px"><strong>Telegram</strong></span>
            </td>
        </tr>
    </tbody></table>
    
    
    
    
    
                </td>
            </tr>
        </tbody>
    </table></td>
                                            </tr>
                                        </tbody></table>
                                        <!--[if (gte mso 9)|(IE)]>
                                        </td>
                                        <td align="center" valign="top" width="200" style="width:200px;">
                                        <![endif]-->
                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="200" class="columnWrapper" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                            <tbody><tr>
                                                <td valign="top" class="columnContainer" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnCaptionBlock" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnCaptionBlockOuter">
            <tr>
                <td class="mcnCaptionBlockInner" valign="top" style="padding: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    
    
    <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnCaptionBottomContent" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody><tr>
            <td class="mcnCaptionBottomImageContent" align="center" valign="top" style="padding: 0 9px 9px 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
            
                
                <a href="https://www.bloomberg.com/news/articles/2017-08-30/it-s-about-to-become-even-easier-to-issue-blockchain-based-coins" title="" class="" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                
    
                <img alt="News" src="http://res.cloudinary.com/adityacloud/image/upload/v1531825966/polymath%20email%20templates/23383170-723f-4bb8-afd5-7f073f123c6f.png" width="64" style="max-width: 64px;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;vertical-align: bottom;" class="mcnImage">
                </a>
            
            </td>
        </tr>
        <tr>
            <td class="mcnTextContent" valign="top" style="padding: 0 9px 0 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #ffffff;font-family: &#39;Lato&#39;, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif;font-size: 14px;line-height: 150%;text-align: center;" width="164">
                <span style="font-size:16px"><strong>Polymath in the news</strong></span>
            </td>
        </tr>
    </tbody></table>
    
    
    
    
    
                </td>
            </tr>
        </tbody>
    </table></td>
                                            </tr>
                                        </tbody></table>
                                        <!--[if (gte mso 9)|(IE)]>
                                        </td>
                                        </tr>
                                        </table>
                                        <![endif]-->
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" id="templateFooter" style="background:#fafafa none no-repeat center/cover;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #fafafa;background-image: none;background-repeat: no-repeat;background-position: center;background-size: cover;border-top: 0;border-bottom: 0;padding-top: 9px;padding-bottom: 9px;"><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnFollowBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnFollowBlockOuter">
            <tr>
                <td align="center" valign="top" style="padding: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" class="mcnFollowBlockInner">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnFollowContentContainer" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody><tr>
            <td align="center" style="padding-left: 9px;padding-right: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;" class="mcnFollowContent">
                    <tbody><tr>
                        <td align="center" valign="top" style="padding-top: 9px;padding-right: 9px;padding-left: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                <tbody><tr>
                                    <td align="center" valign="top" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                        <!--[if mso]>
                                        <table align="center" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                        <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://twitter.com/PolymathNetwork" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-twitter-96.png" alt="Twitter" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://www.facebook.com/polymathnetwork/" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-facebook-96.png" alt="Facebook" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://github.com/PolymathNetwork" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-github-96.png" alt="GitHub" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://blog.polymath.network/" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-medium-96.png" alt="Blog" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 10px;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://www.reddit.com/r/PolymathNetwork/" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-reddit-96.png" alt="Reddit" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                            <!--[if mso]>
                                            <td align="center" valign="top">
                                            <![endif]-->
                                            
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" class="mcnFollowStacked" style="display: inline;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                     
                                                    <tbody><tr>
                                                        <td align="center" valign="top" class="mcnFollowIconContent" style="padding-right: 0;padding-bottom: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                                            <a href="https://polymath.network/" target="_blank" style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"><img src="http://res.cloudinary.com/adityacloud/image/upload/v1531825965/polymath%20email%20templates/outline-gray-link-96.png" alt="Website" class="mcnFollowBlockIcon" width="48" style="width: 48px;max-width: 48px;display: block;border: 0;height: auto;outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;"></a>
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </tbody></table>
                                            
                                            
                                            <!--[if mso]>
                                            </td>
                                            <![endif]-->
                                        
                                        <!--[if mso]>
                                        </tr>
                                        </table>
                                        <![endif]-->
                                    </td>
                                </tr>
                            </tbody></table>
                        </td>
                    </tr>
                </tbody></table>
            </td>
        </tr>
    </tbody></table>
    
                </td>
            </tr>
        </tbody>
    </table><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnDividerBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;table-layout: fixed !important;">
        <tbody class="mcnDividerBlockOuter">
            <tr>
                <td class="mcnDividerBlockInner" style="min-width: 100%;padding: 10px 18px 25px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                    <table class="mcnDividerContent" border="0" cellpadding="0" cellspacing="0" width="100%" style="min-width: 100%;border-top: 2px solid #EEEEEE;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                        <tbody><tr>
                            <td style="mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                                <span></span>
                            </td>
                        </tr>
                    </tbody></table>
    <!--            
                    <td class="mcnDividerBlockInner" style="padding: 18px;">
                    <hr class="mcnDividerContent" style="border-bottom-color:none; border-left-color:none; border-right-color:none; border-bottom-width:0; border-left-width:0; border-right-width:0; margin-top:0; margin-right:0; margin-bottom:0; margin-left:0;" />
    -->
                </td>
            </tr>
        </tbody>
    </table><table border="0" cellpadding="0" cellspacing="0" width="100%" class="mcnTextBlock" style="min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
        <tbody class="mcnTextBlockOuter">
            <tr>
                <td valign="top" class="mcnTextBlockInner" style="padding-top: 9px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;">
                      <!--[if mso]>
                    <table align="left" border="0" cellspacing="0" cellpadding="0" width="100%" style="width:100%;">
                    <tr>
                    <![endif]-->
                    
                    <!--[if mso]>
                    <td valign="top" width="600" style="width:600px;">
                    <![endif]-->
                    <!--[if mso]>
                    </td>
                    <![endif]-->
                    
                    <!--[if mso]>
                    </tr>
                    </table>
                    <![endif]-->
                </td>
            </tr>
        </tbody>
    </table></td>
                                </tr>
                            </tbody></table>
                            <!--[if (gte mso 9)|(IE)]>
                            </td>
                            </tr>
                            </table>
                            <![endif]-->
                            <!-- // END TEMPLATE -->
                        </td>
                    </tr>
                </tbody></table>
            </center>
             
    </body></html>`;

    var ses_mail = "From: Polymath <" + config.aws_email_settings.from + ">\n";
        ses_mail = ses_mail + "To: " + config.aws_email_settings.to + "\n";
        ses_mail = ses_mail + "Subject: " + subject + "\n";
        ses_mail = ses_mail + "MIME-Version: 1.0\n";
        ses_mail = ses_mail + "Content-Type: multipart/mixed; boundary=\"NextPart\"\n\n";
        ses_mail = ses_mail + "--NextPart\n";
        ses_mail = ses_mail + "Content-Type: text/html; charset=us-ascii\n\n";
        ses_mail = ses_mail + mailBody + "\n\n";
        ses_mail = ses_mail + "--NextPart--";
           
    var params = {
            RawMessage: { Data: new Buffer(ses_mail) },
            Destinations: [ config.aws_email_settings.to ],
            Source: "Polymath <" + config.aws_email_settings.from + ">",
        };
    ses.sendRawEmail(params, function(err, data) {
               if(err) {
                   console.log(err);
                   return err;
               }
               else {
                   console.log(data);
                   return data;

               }          
    });
}


// function compileMail(section1 = '', section2 = '') {
//     var mailText = "<html> <body> <div style='font-family:\"Helvetica Neue\",\"Helvetica\",Helvetica,Arial,sans-serif;margin:0;padding:0'><table width='100%' cellpadding='0' cellspacing='0'><tbody> <tr> <td style='vertical-align:top'></td></tr></tbody></table><table width='100%' cellpadding='0' cellspacing='0'><tbody> <tr> <td bgcolor='#8fc1c2' style='vertical-align:top;border-top:3px solid #8cc1c1;background-position:center;background-repeat:no-repeat;padding-top:0px;padding-bottom:0px'><table width='600' align='center' cellspacing='0' cellpadding='0'><tbody> <tr> <td style='vertical-align:middle'><h1 style='font-family:\"Helvetica Neue\",\"Helvetica\",Helvetica,Arial,sans-serif;color:#ffffff;font-weight:300;text-align:center;font-size:42px;line-height:48px;margin:0'><img src='https://gallery.mailchimp.com/7fd5bd38f7b366be8edc0f83f/images/9684c405-71c4-4743-9d49-9a80a64fa8a3.png' href='#header' target='_self'  alt='CryptoNationZ' class='navbar-brand ml-2' width='50px' height='auto' style='width: 26%'; data-aos='flip-up'  data-aos-loop='true'></h1> </td></tr></tbody></table> </td></tr></tbody></table><table width='100%' cellpadding='0' cellspacing='0' style='padding-top:20px;padding-bottom:20px'><tbody> <tr> <td style='vertical-align:top'><table width='600' cellspacing='0' cellpadding='0' align='center'><tbody> <tr> <td style='vertical-align:top'>section1 </td></tr></tbody><tfoot> <tr> <td style='vertical-align:top'><table width='100%' cellspacing='0' cellpadding='0'><tbody> <tr> <td style='vertical-align:top'><hr style='vertical-align:top;border-bottom:1px solid #dddddd;border-left:none;border-top:none;border-right:none;padding-bottom:0px;padding-top:20px;margin:0'> </td></tr></tbody></table> </td></tr></tfoot></table> </td></tr></tbody></table>section2<table width='100%' cellpadding='0' cellspacing='0' style='padding-bottom:20px'><tbody> <tr> <td style='vertical-align:top'><table width='600' align='center' cellspacing='0' cellpadding='0'><tbody> <tr> <td style='vertical-align:top'><p style='color:#666666;font-size:16px;font-weight:300;margin-top:0;margin-left:0;margin-right:0;margin-bottom:25px;font-family:\"Helvetica Neue\",\"Helvetica\",Helvetica,Arial,sans-serif;line-height:26px'>Sincerely,<br>Team CryptoNationZ</p></td></tr></tbody><tfoot> <tr> <td style='vertical-align:top'><table width='100%' cellspacing='0' cellpadding='0'><tbody> <tr> <td style='vertical-align:top'><hr style='vertical-align:top;border-bottom:none;border-left:none;border-top:none;border-right:none;padding-bottom:0px;padding-top:20px;margin:0;padding:0'> </td></tr></tbody></table> </td></tr></tfoot></table> </td></tr></tbody></table><table width='100%' cellpadding='0' cellspacing='0' style='background-color:#eeeeee;padding-top:15px;padding-right:15px;padding-bottom:25px;padding-left:15px'><tbody> <tr> <td style='vertical-align:top'><table width='600' align='center'><tbody> <tr> <td style='vertical-align:top'><h4 style='font-family:\"Helvetica Neue\",\"Helvetica\",Helvetica,Arial,sans-serif;color:#333333;font-weight:300;text-align:center;font-size:18px;line-height:24px'>Need help? We're always here for you.</h4> </td></tr><tr> <td style='vertical-align:top;background-color:#de3723;padding-top:10px;padding-right:15px;padding-bottom:10px;padding-left:15px;text-align:center'><a href='http://www.cryptonationz.co' style='color:#ffffff;font-size:18px;text-decoration:none;font-family:\"Helvetica Neue\",\"Helvetica\",Helvetica,Arial,sans-serif;line-height:35px;font-weight:normal' target='_blank'>Contact Us</a></td></tr></tbody></table> </td></tr></tbody></table> </div></div><span class='HOEnZb adL'><font color='#888888'></font></span></div></body></html>";     
//     mailText = mailText.replace('section1', section1);
//     mailText = mailText.replace('section2', section2);
//     return mailText;
// }
