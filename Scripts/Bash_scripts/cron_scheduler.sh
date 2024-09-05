# add this line of code to cron job by runnin the command 'crontab -e'
0 */1 * * 1-6 $HOME/CDE_linux/Scripts/Bash_scripts/ETL.sh >> $HOME/CDE_linux/run.log 2>&1
