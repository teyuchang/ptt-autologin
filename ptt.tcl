#!/usr/local/bin/expect -f
set timeout 60
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no bbsu@ptt.cc
expect "new"
send "$env(PTT_ID)\r"
expect ":"
send "$env(PTT_PWD)\r"
expect {
	"您想刪除其他重複登入的連線嗎" {
		send "n\r"
			exp_continue
	}
	"請按任意鍵繼續" {
		send "\r"
			exp_continue
	}
	"離開，再見" {
		send "g\r"
			exp_continue
	}
	"您確定要離開" {
		send "y\r"
	}
}
exit

