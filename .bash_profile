#
# ~/.bash_profile
#

export JAVA_HOME=/usr/lib/jvm/default
export ORACLE_HOME=/usr/lib/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/share/nvim/mason/bin:$HOME/.local/bin:$ORACLE_HOME/bin:/opt/Apache/db-derby/bin"
export EDITOR=nvim
export TERMINAL=/usr/bin/kitty
alias sqlplus='rlwrap sqlplus'
alias ij='rlwrap ij'

[[ -f ~/.bashrc ]] && . ~/.bashrc

