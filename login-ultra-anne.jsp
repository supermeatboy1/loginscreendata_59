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
  /* Body Layout */
  .bb-login {
    background: url(https://raw.githubusercontent.com/supermeatboy1/loginscreendata_59/main/campus-blue-tinted-desaturated.jpg) no-repeat center center fixed;
    background-size: 100% auto;
  }

  .bb-login #login-block {
    min-width: 15rem;
    max-width: 32rem;
  }

  .login-form {
    background-color: #333333;
    padding: 1.0cm 1.0cm 1.0cm 1.0cm;
    margin-top: 1.0cm;
    border-radius: 1.2em;
    filter: drop-shadow(1.0em 1.0em 1.0em #0f0f0f);

    width: 100%;
  }


  .bb-login .login-page-announcements #loginAnnouncements>ul>li .vtbegenerated {
    max-height: 100%;
  }

  </style>

  <!--- Custom Layout End --->

  <%@ include file="/webapis/ui/cookie-disclosure-login.jspf"%>

  <div id="loginLang" class="clearfix">
    <loginUI:localePicker />
  </div>

  <div class="row">
    <!-- LOGIN INPUT -->
  	<div id="login-block" class="small-11 small-centered medium-12 medium-centered text-center columns">
  		<%--<loginUI:loginHeaderIcon loginCssClass="login-logo new-logo" customizedCssClass="customized-logo" headerText="${productName}" />--%>
  		<loginUI:errorMessage />

  		<c:if test="${ ( param.isSuccessfulPasswordUpdate eq 'true' ) && ( param.action eq 'relogin' )  }">
  	      <%@ include file="/passwordSuccessConfirmationReceipt.jspf"%>
  		</c:if>

  		<div id="login-form" class="login-form">

        <div class= "imahe" style="text-align: center;">
          <img src="https://mcm.edu.ph/wp-content/uploads/2021/11/MCM-Digital-Logo-White-V-01.png" height="250" width="250">
        </div>

  			<loginUI:loginForm />
  		</div>
    </div>
    <!-- ANNOUNCEMENTS -->
    <div class="login-page-announcements">
      <loginUI:systemAnnouncements maxItems="5" />

    </div>
    <div class="small-12 small-centered text-center columns">
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
</bbNG:genericPage>
