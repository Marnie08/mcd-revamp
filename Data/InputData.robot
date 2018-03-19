*** Variables ***
#Configuration
${ENVIRONMENT}                         qa
${BROWSER}                             IE
&{URL}                                 qa=https://qalogin.ulscm.com/RPUI/cpsmcd/signin.aspx?wa=wsignin1.0&wtrealm=uri%3acpsmcd&wreply=https%3a%2f%2fqa-cpsmcd.ulscm.com%2f_trust%2fdefault.aspx&wctx=https%3a%2f%2fqa-cpsmcd.ulscm.com%2fsites%2fmcd1%2f_layouts%2fAuthenticate.aspx%3fSource%3d%252Fsites%252Fmcd1
${INVALID_CREDENTIALS_PATH_CSV}        C:\\development\\robot-scripts\\mcd-revamp\\Data\\UserDetails\\InvalidUsers.csv
${VALID_CREDENTIALS_PATH_CSV}          C:\\development\\robot-scripts\\mcd-revamp\\Data\\UserDetails\\Users.csv

#Input Data
    #Valid Credentials
&{ADMIN_USER}                          Username=Clarence.campilan@ul.com  Password=Welcome1
&{REGULAR_USER}                        Username=cvss3user1@gmail.com  Password=Welcome1
&{QFL_QML_FACILITY_GOVERNANCE}         Username=michelle.tan@ul.com  Password=Welcome1

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

#Registration Form
${REGISTRATION_EMAIL}                  xpath=//*[@id="PlaceHolderMain_Register_Email"]
${REGISTRATION_CONFIRM_EMAIL}          xpath=//*[@id="PlaceHolderMain_Register_EmailConfirm"]
${REGISTRATION_RADIO_YES1}             xpath=//*[@id="uniform-PlaceHolderMain_Register_elearningChkYes"]
${REGISTRATION_RADIO_YES2}             xpath=//*[@id="uniform-PlaceHolderMain_Register_mcdStaffChkYes"]
${REGISTRATION_YES_LABEL1}             xpath=//*[@id="PlaceHolderMain_Register_registerTblContainer"]/table/tbody/tr[10]/td[1]/text()[1]
${REGISTRATION_YES_LABEL2}             xpath=//*[@id="PlaceHolderMain_Register_registerTblContainer"]/table/tbody/tr[12]/td[1]/text()[1]
${REGISTRATION_RADIO_NO1}              xpath=//*[@id="uniform-PlaceHolderMain_Register_elearningChkNo"]
${REGISTRATION_RADIO_NO2}              xpath=//*[@id="PlaceHolderMain_Register_mcdStaffChkNo"]
${REGISTRATION_NO_LABEL1}              xpath=//*[@id="PlaceHolderMain_Register_registerTblContainer"]/table/tbody/tr[10]/td[1]/text()[2]
${REGISTRATION_NO_LABEL2}              xpath=//*[@id="PlaceHolderMain_Register_registerTblContainer"]/table/tbody/tr[12]/td[1]/text()[2]
${REGISTRATION_PASSWORD}               xpath=//*[@id="PlaceHolderMain_Register_Password"]
${REGISTRATION_CONFIRM_PASSWORD}       xpath=//*[@id="PlaceHolderMain_Register_PasswordConfirm"]
${REGISTRATION_SECURITY}               xpath=//*[@id="PlaceHolderMain_Register_SecurityQuestion"]


#Tutorial Splash Screen Objects
${TUTORIAL_CAROUSEL}                   xpath=//*[@id="carousel-example-generic"]/div
#${TUTORIAL_DOT_GEN]                    xpath=//*[@id="carousel-example-generic"]/ol/li
#${TUTORIAL_IMAGE_GEN]                  xpath=//*[@id="carousel-example-generic"]/div/div
${TUTORIAL_DOT3}                       xpath=//*[@id="carousel-example-generic"]/ol/li[3]
${TUTORIAL_CANCEL_BTN}                 xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[1]
${TUTORIAL_FINISH_BTN}                 xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]
${TUTORIAL_NEVER_BOX}                  xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/label[2]/input
${TUTORIAL_SKIP_BTN}                   xpath=//*[@id="carousel-example-generic"]/div/div[1]/div[2]/div[1]/a[1]
${TUTORIAL_NEXT_BTN}                   xpath=//*[@id="carousel-example-generic"]/div/div[1]/div[2]/div[1]/a[2]
${TUTORIAL_SKIP_MSG}                   Are you sure you want to skip the tutorial?
${TUTORIAL_NEVER_MSG}                  Never show this again

#Page Header Objects
${PAGE_HEADER_BRAND}                   xpath=/html/body/div/div/div/nav[1]/div[1]/a
${PAGE_HEADER_SEARCHBOX}               xpath=//*[@id="searchtxt"]
${PAGE_HEADER_MAGLENS}                 xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/form/div[1]/div[2]/button/i
${PAGE_HEADER_SAVED_SEARCH}            xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[2]
${PAGE_HEADER_HELP}                    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[2]/a
${PAGE_HEADER_USER}                    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a

${SEARCH_BOX_ALL}                      xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/form/div[2]/ul/li[1]
${SEARCH_BOX_SPEC_LIB}                 xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/form/div[2]/ul/li[2]
${SEARCH_ITEM}                         Taiwan

#Knowledge Hub Objects
${KNOWLEDGE_HUB_SPEC_LIB}              Specification Library
${KNOWLEDGE_HUB_PROM_PROD}             Promotional Products
${KNOWLEDGE_HUB_FOOD_CS}               Food Contact Standards
${KNOWLEDGE_HUB_CHEM_MAT}              Chemicals & Materials
${KNOWLEDGE_HUB_LAWS_RULES}            Laws, Rules & Standards
${KNOWLEDGE_HUB_AUDIT_PROG}            Audit Program
${KNOWLEDGE_HUB_FAC_GOV}               Facility Governance
${KNOWLEDGE_HUB_PROG_INFO}             Program Information
${KNOWLEDGE_HUB_LABS_ONLY}             Labs Only
${KNOWLEDGE_HUB_PROJ_MGT}              Project Management
${KNOWLEDGE_HUB_FILE_TRANS}            File Transfer
${KNOWLEDGE_HUB_SEARCH_DDOWN}          xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/form/div[2]/ul
####Left Panel
${KNOWLEDGE_HUB_ACTIVITY_FEED}         xpath=/html/body/div/div/div/div/div[2]/div[1]/div/div/div[1]/h3
${KNOWLEDGE_HUB_ACTIVITY_FEED_ICON}    xpath=/html/body/div/div/div/div/div[2]/div[1]/div/div/div[1]/div
####Right Panel
${KNOWLEDGE_HUB_RECENTLY_VIEWED}       xpath=/html/body/div/div/div/div/div[2]/div[3]/mcd-recently-viewed/div/div[1]
${KNOWLEDGE_HUB_RESOURCES}             xpath=/html/body/div/div/div/div/div[2]/div[3]/div/div/div[1]


#Search Result Page
${SEARCH_RESULT_TITLE}                 xpath=/html/body/div/div/div/div/div[2]/div[1]/div[1]/div[1]/h3





