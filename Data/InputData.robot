*** Variables ***
#Configuration
${ENVIRONMENT}      qa
${BROWSER}          IE
&{URL}              qa=https://qalogin.ulscm.com/RPUI/cpsmcd/signin.aspx?wa=wsignin1.0&wtrealm=uri%3acpsmcd&wreply=https%3a%2f%2fqa-cpsmcd.ulscm.com%2f_trust%2fdefault.aspx&wctx=https%3a%2f%2fqa-cpsmcd.ulscm.com%2fsites%2fmcd1%2f_layouts%2fAuthenticate.aspx%3fSource%3d%252Fsites%252Fmcd1
${INVALID_CREDENTIALS_PATH_CSV}  C:\\development\\robot-scripts\\mcd-revamp\\Data\\InvalidUsers.csv
${VALID_CREDENTIALS_PATH_CSV}  C:\\development\\robot-scripts\\mcd-revamp\\Data\\Users.csv
#&{URL}              qa=https://qa-cpsmcd.ulscm.com/sites/mcd1

#Input Data
    #Valid Credentials
&{ADMIN_USER}       Username=Clarence.campilan@ul.com  Password=Welcome1
&{REGULAR_USER}     Username=cvss3user1@gmail.com  Password=Welcome1

    #Invalid Credentials
#&{UNREGISTERED_USER}  Username=mnaguas@yahoo.com  Password=TestPassword!  ExpectedErrorMessage=Login Failure: Unknown User.
#&{INVALID_USERNAME_USER}  Username=mnaguas@yahoo.com  Password=Welcome1  ExpectedErrorMessage=Login Failure: Unknown User.
#&{INVALID_PASSWORD_USER}  Username=Clarence.campilan@ul.com  Password=TestPassword!  ExpectedErrorMessage=Login Failure: The User Name or Password is incorrect!
#&{BLANK_CREDENTIALS_USER}  Username=#BLANK  Password=#BLANK  ExpectedErrorMessage=Login Failure: Both UserName and Password is required
#&{VALID_USERNAME_BLANK_PWD}   Username=Clarence.campilan@ul.com  Password=#BLANK  ExpectedErrorMessage=Login Failure: The User Name or Password is incorrect!
#&{VALID_PASSWORD_BLANK_USERNAME}  Username=#BLANK  Password=Welcome1  ExpectedErrorMessage=Login Failure: Both UserName and Password is required

#Landing Page Banner
${LANDING_PAGE_BANNER}      Welcome to McDonald’s
${LANDING_PAGE_LABEL}       css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > h4
${LANDING_PAGE_CONTACT}     css=body > div > div > div.col-md-12 > div.login > div.col-md-8.col-xs-12.login-hero > p

#Tutorial Splash Screen Objects
${TUTORIAL_DOT1}
${TUTORIAL_DOT2}
${TUTORIAL_DOT3}          xpath=//*[@id="carousel-example-generic"]/ol/li[3]
${TUTORIAL_CANCEL_BTN}      xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[1]
${TUTORIAL_FINISH_BTN}      xpath=//*[@id="carousel-example-generic"]/div/div[3]/div[2]/div[2]/p/a[2]
