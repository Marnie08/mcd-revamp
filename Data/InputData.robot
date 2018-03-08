*** Variables ***
#Configuration
${ENVIRONMENT}                      qa
${BROWSER}                          IE
&{URL}                              qa=https://qalogin.ulscm.com/RPUI/cpsmcd/signin.aspx?wa=wsignin1.0&wtrealm=uri%3acpsmcd&wreply=https%3a%2f%2fqa-cpsmcd.ulscm.com%2f_trust%2fdefault.aspx&wctx=https%3a%2f%2fqa-cpsmcd.ulscm.com%2fsites%2fmcd1%2f_layouts%2fAuthenticate.aspx%3fSource%3d%252Fsites%252Fmcd1
${INVALID_CREDENTIALS_PATH_CSV}     C:\\development\\robot-scripts\\mcd-revamp\\Data\\InvalidUsers.csv
${VALID_CREDENTIALS_PATH_CSV}       C:\\development\\robot-scripts\\mcd-revamp\\Data\\Users.csv

#Input Data
    #Valid Credentials
&{ADMIN_USER}                       Username=Clarence.campilan@ul.com  Password=Welcome1
&{REGULAR_USER}                     Username=cvss3user1@gmail.com  Password=Welcome1
&{QFL_QML_FACILITY_GOVERNANCE}      Username=michelle.tan@ul.com  Password=Welcome1

    #Invalid Credentials
#&{UNREGISTERED_USER}  Username=mnaguas@yahoo.com  Password=TestPassword!  ExpectedErrorMessage=Login Failure: Unknown User.
#&{INVALID_USERNAME_USER}  Username=mnaguas@yahoo.com  Password=Welcome1  ExpectedErrorMessage=Login Failure: Unknown User.
#&{INVALID_PASSWORD_USER}  Username=Clarence.campilan@ul.com  Password=TestPassword!  ExpectedErrorMessage=Login Failure: The User Name or Password is incorrect!
#&{BLANK_CREDENTIALS_USER}  Username=#BLANK  Password=#BLANK  ExpectedErrorMessage=Login Failure: Both UserName and Password is required
#&{VALID_USERNAME_BLANK_PWD}   Username=Clarence.campilan@ul.com  Password=#BLANK  ExpectedErrorMessage=Login Failure: The User Name or Password is incorrect!
#&{VALID_PASSWORD_BLANK_USERNAME}  Username=#BLANK  Password=Welcome1  ExpectedErrorMessage=Login Failure: Both UserName and Password is required

#Landing Page Banner
${LANDING_PAGE_BANNER}                 Welcome to McDonald’s
${LANDING_PAGE_LABEL}                  css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > h4
${LANDING_PAGE_CONTACT}                css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > p

${SIGNIN_FORGOT_PASSWORD}              xpath=//*[@id="fpLink"]
${SIGN_IN_USERNAME_FIELD}              css=#PlaceHolderMain_Login2_UserName
${SIGN_IN_PASSWORD}                    css=#PlaceHolderMain_Login2_Password
${SIGN_IN_SUBMIT}                      css=#SubmitLogin
${SIGN_IN_FORGOT_PASSWORD}             css=#PlaceHolderMain_Login2_ForgotPassword1_forgotPasswordTextLbl
${SIGN_IN_NEW_USER}                    css=#LoginContainers > div:nth-child(3) > button
${SIGN_IN_LOGO}                        css=body > div > div > div.col-md-12 > div.login > div.col-md-4.col-xs-12.login-form.text-center > div.login-logo

#Forgot Password Container
${FORGOT_PASSWORD_POPUP}               xpath=//*[@id="forgotPasswordContainer"]
${FORGOT_PASSWORD_TEXTBOX}             xpath=//*[@id="PlaceHolderMain_Login2_ForgotPassword1_txtEmail"]
${FORGOT_PASSWORD_SUBMIT_BTN}          xpath=//*[@id="PlaceHolderMain_Login2_ForgotPassword1_Submit"]
${FORGOT_PASSWORD_CLOSE}               xpath=//*[@id="forgotPasswordContainer"]/div[1]

#Tutorial Splash Screen Objects
${TUTORIAL_DOT1}
${TUTORIAL_DOT2}
${TUTORIAL_DOT3}                       xpath=//*[@id="carousel-example-generic"]/ol/li[3]
${TUTORIAL_CANCEL_BTN}                 xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[1]
${TUTORIAL_FINISH_BTN}                 xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]
${TUTORIAL_NEVER_BOX}                  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/label[2]/input
${TUTORIAL_SKIP_BTN}                   xpath=//*[@id="carousel-example-generic"]/div/div[1]/div[2]/div[1]/a[1]
${TUTORIAL_NEXT_BTN}                   xpath=//*[@id="carousel-example-generic"]/div/div[1]/div[2]/div[1]/a[2]
${TUTORIAL_SKIP_MSG}                   Are you sure you want to skip the tutorial?
${TUTORIAL_NEVER_MSG}                  Never show this again
