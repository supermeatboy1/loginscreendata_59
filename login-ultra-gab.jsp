<%@ include file="/webapis/ui/doctype.jspf" %>
<%@ page import="blackboard.servlet.util.CourseCatalogUtil" %>
<%@ taglib uri="/bbNG" prefix="bbNG" %>
<%@ taglib uri="/loginUI" prefix="loginUI" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="productName" value="${ loginUI:getProductName() }" />

<fmt:message var="viewCourseCatalogLinkText" key="gatewayButtons.view.course.catalog" bundle="${bundles.tags}"/>

<bbNG:genericPage authentication="N" wrapper="false" onLoad="loadLoginPage()" bodyClass="bb-login hide-focus-outline" globalNavigation="false" skipCoreCss="true" allowScale="true">
  <bbNG:cssFile href="/ui-ultra/css/ultra.css" />
  <bbNG:jsFile href="/ui-ultra/js/hide-focus-outline.js" />
  <bbNG:jsFile href="/ui-ultra/js/login-page.js" />

  <bbNG:jsBlock>
    <script type="text/javascript">
      function loadLoginPage() {
        if(document.forms.login.user_id != undefined)
        {
          verify_username_password(document.forms.login);
        }
        setTimeout("triggerScreenreaderAlert()", 500);
      }

      function triggerScreenreaderAlert() {
        if (document.getElementById('loginErrorMessage')) {
          $('loginErrorMessage').update($('loginErrorMessage').innerHTML);
        }
      }
    </script>
  </bbNG:jsBlock>
  <script>
    $('#loginAnnouncements').height($('#loginAnnouncements')[0].scrollHeight)
  </script>

  <!--- Custom Layout Start --->

  <style type="text/css">
  /* MMCM Digital Logo */
  .imahe {
    padding-top: 1.0em;
    padding-bottom: 2.0em;
    background-repeat: no-repeat;
  }

/* Media Queries */

/* ================================================================================================= */
/* Portrait Orientation (Mobile Phones) */
/* ================================================================================================= */

@media only screen and (min-width: 0) {
  .bb-login {
    width: 100%;
    overflow: auto;
    position: relative;
    height: auto;
  }
  .bb-login:before {
    background-image: url("https://raw.githubusercontent.com/supermeatboy1/loginscreendata_59/main/campus-photo-gradient.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: scroll;
    background-position: center center;
    position: absolute;
    content: "";
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: -1;
  }
  .bb-login #login-block {
    background-color: #333333;
    margin-top: 1.5em;
    border-radius: 1.2em;

    filter: drop-shadow(1.0em 1.0em 1.0em #0f0f0f);

    padding-top: 2.0em;
    padding-right: 1.0em;
    padding-left: 1.0em;
    padding-bottom: 3.0em;
  }
  .login-page-announcements {
    width: 91%;
    max-width: 91%;
  }
  .bb-login .login-page-announcements #loginAnnouncements {
    max-width: 100%;
    margin-left: 10%;
    margin-right: auto;
  }
  .bb-login .login-page-announcements #loginAnnouncements>ul>li {
    border-radius: 1.0em;
    filter: drop-shadow(0.8em 0.8em 0.8em #0f0f0f);
  }
  .bb-login .login-page-announcements #loginAnnouncements>ul>li .vtbegenerated {
    max-height: 7.25cm;
  }
}

/* ================================================================================================= */
/* Landscape Orientation (Desktops and PCs) */
/* ================================================================================================= */

@media only screen and (min-aspect-ratio: 4/3) and (orientation: landscape) {
  .bb-login #login-block {
    min-width: 15rem;
    max-width: 33rem;

    float: right;
    width: 40.5%;

    padding-right: 0.5cm;
  }

  .login-page-announcements {
    float: left;
    width: 40.5%;
    padding-bottom: 1.5cm;
  }

  .bb-login {
    width: 100%;
    overflow: auto;
    position: relative;
    height: auto;
  }
  .bb-login:before {
    background-image: url("https://raw.githubusercontent.com/supermeatboy1/loginscreendata_59/main/campus-photo-gradient.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: scroll;
    background-position: center center;
    
    position: absolute;
    content: "";
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: -1;
  }

  .bb-login #copyright {
    margin-top: 0;
  }

  .bb-login .login-page-announcements #loginAnnouncements>ul>li .vtbegenerated {
    max-height: 100%;
  }

  .row {
    max-width: 90%;
  }

  .bb-login .login-page-announcements #loginAnnouncements>ul>li {
    padding: 0 1.0rem 1.0rem 1.0rem;
    border-radius: 1.0em;
    filter: drop-shadow(0.8em 0.8em 0.8em #0f0f0f);
  }
  .bb-login .login-page-announcements #loginAnnouncements > ul > li .announcementDate {
    padding: 1.0rem 0 0 0;
  }
  
  .bb-login #ultraCourseCatalogLink {
    margin-top: 1rem;
  }
  .bb-login #copyright {
    margin-top: 1rem;
  }

  .catalog-and-copyright-info {
    padding-top: 0.2cm;
  }
}

  </style>

  <!--- Custom Layout End --->

  <%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

  <div id="loginLang" class="clearfix">
    <loginUI:localePicker />
  </div>

  <div class="row">
    <div class="custom-overflow">
    <!-- LOGIN INPUT -->
  	<div id="login-block" class="small-11 small-centered medium-12 medium-centered text-center columns">
  		<%--<loginUI:loginHeaderIcon loginCssClass="login-logo new-logo" customizedCssClass="customized-logo" headerText="${productName}" />--%>
  		<loginUI:errorMessage />

  		<c:if test="${ ( param.isSuccessfulPasswordUpdate eq 'true' ) && ( param.action eq 'relogin' )  }">
  	      <%@ include file="/passwordSuccessConfirmationReceipt.jspf"%>
  		</c:if>

  		<div id="login-form" class="login-form">

        <div class= "imahe" style="text-align: center;">
          <img src="https://raw.githubusercontent.com/supermeatboy1/loginscreendata_59/main/MMCM%20DIGITAL%20-%20FULL%20RED.png" class="mmcm-digital-logo">
        </div>

  			<loginUI:loginForm />

        <!-- View Course Catalog, Copyright -->
        <div id="catalog-and-copyright-info" class="small-12 small-centered text-center columns">
          <c:if test="${ CourseCatalogUtil.getAllowCatalog() }">
            <div id="ultraCourseCatalogLink">
              <a href="${ CourseCatalogUtil.getCatalogUrl( CourseCatalogUtil.getAllowCatalog() ) }">${viewCourseCatalogLinkText}</a>
            </div>
          </c:if>
          <bbNG:copyright />
          <div id="loginOptions">
            <loginUI:gatewayButtons />
          </div>
        </div>

  		</div>
    </div>
    <!-- ANNOUNCEMENTS -->
    <div class="login-page-announcements">
      <loginUI:systemAnnouncements maxItems="5" />
    </div>

    </div>
  </div>
</bbNG:genericPage>
