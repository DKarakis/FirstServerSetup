# FirstServerSetup
This shell script helps you to setup your new linux server with basic update and installation functions like yum and vim.
Basicly what shell does;

1. Updating Yum 
2. Installing Vim
3. Reading SHH Key file in given location (upload must be needed)
4. Disabling Root Password SSH login
5. Sending mail - in given mail address- every time when user logged in 
6. Restarting SSH Service
7. Installing Fail2Ban ( more info : http://www.fail2ban.org/)
8. Setting Fail2Ban for first boot
9. Creating a config file for Fail2Ban (Bantime for 1 day)
10. Restarting Fail2Ban service

#Usage

Run shell script in command line and script lets you to go through step by step.
