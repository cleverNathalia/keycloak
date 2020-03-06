
<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>

    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">

    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>

        <#--  VUETIFY ADD-ON START -->
        <#--  LOGIN FORM  -->
            <v-form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                <#--  USERNAME  -->
                    <#if !realm.loginWithEmailAllowed>
                         <v-text-field label="Username" tabindex="1" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(login.username!'')}" type="text" />
                        <#elseif !realm.registrationEmailAsUsername>
                        <v-text-field label="Username or Email" tabindex="1" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(login.username!'')}" type="text" />
                        <#else>
                        <v-text-field label="Email" tabindex="1" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(login.username!'')}" type="text" />
                    </#if>
                    <#if usernameEditDisabled??>
                        <v-text-field label="Username" tabindex="1" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(login.username!'')}" type="text" disabled />
                    <#else>
                        <v-text-field label="Username" tabindex="1" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                    </#if>
                </div>
                
                <div class="${properties.kcFormGroupClass!}">
                    <#--  PASSWORD  -->
                    <v-text-field label="Password" tabindex="2" id="password" class="${properties.kcInputClass!} mx-6" name="password" type="password" autocomplete="off" />
                </div>

                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <#--  REMEBER ME  -->
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        <div class="${properties.kcFormOptionsWrapperClass!}">

                        <#--  FORGOT PASSWAROD  -->
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>

                  </div>

                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">

                  <#--  LOGIN BUTTON  -->
                  <v-card-actions>
                      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                      <v-btn color="primary" tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg('doLogIn')}">Login</v-btn>
                  </v-card-actions>
                  </div>
                  
            </v-form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
        <#--  REGISTER  -->
            <div id="kc-registration">
                <v-card-subtitle>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></v-card-subtitle>
            </div>
        </#if>
    </#if>
</v-card-text>
<#--  VUETIFY ADD-ON END  -->
</@layout.registrationLayout>
