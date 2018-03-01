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
