#1 - Let's update Yum instance
echo "Would you like to update Yum? [y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
        yum -y update
else
        echo "Stopped by user"
fi

#2 - Let's update Vim instance
echo "Would you like to update Yum? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo yum install -y vim
else
        echo "Stopped by user"
fi

#3 - Let's read SSH Pub Key
echo "Please insert ssh folder address."
read folder

mkdir ~/.ssh
chmod 700 ~/.ssh
cat id_rsa.pub >> folder
chmod 600 ~/.ssh/authorized_keys
mv folder ~/.ssh

#4.1 - SSH Password Disable
echo "Would you like to disable ssh password when login ? 1/2 [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sed -i '/PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config
else
        echo "Stopped by user"
fi


#4.2 - SSH Password Disable
echo "Would you like to disable ssh password when login? 2/2 [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sed -i '/PasswordAuthentication/c\PasswordAuthentication yes' /etc/ssh/sshd_config
else
        echo "Stopped by user"
fi

#5 - Sending mail every login
echo "Would you like to send mail everytime when user logged in? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
echo "Enter your email address. [mail@domail.com] "
read input 
echo echo "Alert! - Root Shell Access (ServerName) on:' `date` `who` | mail -s "Alert!: Root Access from `who | cut -d'(' -f2 | cut -d')' -f1`" $input" > ~/.bashrc
else
        echo "Stopped by user"
fi

#6 - SSH Restart 
echo "Would you like to restart SSH service? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo service sshd restart
else
        echo "Stopped by user"
fi


#7 - Fail2Ban Installation
echo "Would you like to install Fail2Ban? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo yum install fail2ban -y
else
        echo "Stopped by user"
fi


#8 - Fail2Ban first boot
echo "Would you like Fail2Ban to run in first boot? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        sudo systemctl enable fail2ban
else
        echo "Stopped by user"
fi

#9 - Fail2Ban Creating a Conf File
echo "Would you like to create config file for Fail2Ban? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        echo "[DEFAULT]
# Ban hosts for one hour:
bantime = 3600

# Override /etc/fail2ban/jail.d/00-firewalld.conf:
banaction = iptables-multiport

[sshd]
enabled = true
" > /etc/fail2ban/jail.local
else
        echo "Stopped by user"
fi


#10 - Fail2Ban Restart
echo "Would you like to restart Fail2Ban? [y,n] "
read input
if [[ $input == "Y" || $input == "y" ]]; then
        service fail2ban restart
else
        echo "Stopped by user"
fi

echo "All is done. Happy coding :) "

fi