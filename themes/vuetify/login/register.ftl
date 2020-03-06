<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <#--  VUETIDY ADD-ON START  -->
        <v-form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">

                <#--  FIRSTNAME  -->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Firstname" type="text" id="firstName" class="${properties.kcInputClass!} mx-6" name="firstName" value="${(register.formData.firstName!'')}" ></v-text-field>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">

                <#--  LASTNAME  -->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Lastname" type="text" id="lastName" class="${properties.kcInputClass!} mx-6" name="lastName" value="${(register.formData.lastName!'')}" ></v-text-field>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">

                <#--  EMAIL  -->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Email" type="text" id="email" class="${properties.kcInputClass!} mx-6" name="email" value="${(register.formData.email!'')}" autocomplete="email" ></v-text-field>
                </div>
            </div>

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">

                <#--  USERNAME  -->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Username" type="text" id="username" class="${properties.kcInputClass!} mx-6" name="username" value="${(register.formData.username!'')}" autocomplete="username" ></v-text-field>
                </div>
            </div>
          </#if>

            <#if passwordRequired>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">

                <#--  PASSWORD  -->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Password" type="password" id="password" class="${properties.kcInputClass!} mx-6" name="password" autocomplete="new-password"></v-text-field>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">

                <#--  PASSWORD CONFIRM-->
                <div class="${properties.kcInputWrapperClass!}">
                    <v-text-field label="Password Confirm" type="password" id="password-confirm" class="${properties.kcInputClass!} mx-6" name="password-confirm" ></v-text-field>
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <#--  REGISTER  -->
                    <v-btn color="primary" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} mx-6" type="submit" value="${msg('doRegister')}">Register</v-btn>
                </div>

                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                <#--  BACK TO LOGIN  -->
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <v-card-subtitle><a href="${url.loginUrl}">Back to Login</a></v-card-subtitle>
                    </div>
                </div>

                
            </div>
        </v-form>
        <#--  VUETIFY ADD-ON END  -->
    </#if>
</@layout.registrationLayout>
