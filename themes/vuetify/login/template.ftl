<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
<#--  VUETIFY ADD-ON START -->
<div id="app">
<v-app id="inspire">
<v-content>
<v-container fluid fill-height>
  <v-layout align-center justify-center>
  <v-flex xs12 sm8 md4>
  <v-card class="elevation-12">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mdi/font@4.x/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.min.css" rel="stylesheet">
<#--  VUETIFY ADD-ON END -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!}">
    <div id="kc-header" class="${properties.kcHeaderClass!}">
    <#--  VUE ADD-ON START  -->
    <v-toolbar color="primary" dark flat>
      <v-toolbar-title>
        <h2 id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!} font-weight-light pl-2 text-center">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</h2>
      </v-toolbar-title>
    </v-toolbar>
    </div>
    <#--  VUE ADD-ON END  -->
    <div class="${properties.kcFormCardClass!} <#if displayWide>${properties.kcFormCardAccountClass!}</#if>">
      <header class="${properties.kcFormHeaderClass!}">
        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
            <div id="kc-locale">
                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                    <div class="kc-dropdown" id="kc-locale-dropdown">
                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                        <ul>
                            <#list locale.supported as l>
                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
        </#if>
        <#--  VUE ADD-ON START  -->
        <v-card-title>
        <h1 id="kc-page-title" class="font-weight-light pl-2"><#nested "header"></h1>
        </v-card-title>
        <#--  VUE ADD-ON END  -->
      </header>
      <div id="kc-content">
        <div id="kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
          
          <#--  VUE ADD-ON START  -->
          <#--  ERROR MESSAGES  -->
              <div class="alert alert-${message.type}">
                  <#if message.type = 'success'><v-alert type="success" class="${properties.kcFeedbackSuccessIcon!} mx-8"><span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span></v-alert></#if>
                  <#if message.type = 'warning'><v-alert type="warning" class="${properties.kcFeedbackWarningIcon!} mx-8"><span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span></v-alert></#if>
                  <#if message.type = 'error'><v-alert type="error" class="${properties.kcFeedbackErrorIcon!} mx-8"><span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span></v-alert></#if>
                  <#if message.type = 'info'><v-alert type="info" class="${properties.kcFeedbackInfoIcon!} mx-8"><span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span></v-alert></#if>
              </div>
          <#--  VUE ADD-ON END  -->
          </#if>

          <#nested "form">

          <#if auth?has_content && auth.showBackButton() >
          <form id="kc-select-back-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
              <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                  <div class="${properties.kcFormGroupClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                           name="back" id="kc-back" type="submit" value="${msg("doBack")}"/>
                  </div>
              </div>
          </form>
          </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>
    </div>
  </div>

<#--  VUE ADD-ON START  -->
  <script src="https://cdn.jsdelivr.net/npm/vue@2.x/dist/vue.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vuetify@2.x/dist/vuetify.js"></script>
  <script>
    new Vue({
      el: '#app',
      vuetify: new Vuetify(),
    })
  </script>

  </v-card>
  </v-flex>
  </v-layout>
</v-container>
</v-content>
</v-app>
</div>
<#--  VUE ADD-ON END  -->
</body>
</html>
</#macro>
