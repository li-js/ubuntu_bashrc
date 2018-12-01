alias ..='clear'
alias h='head'
alias t='tail'
alias c='cat'
alias nv='nvidia-smi'
alias fp='readlink -f' # get full path
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'


alias gpu='python ~/.local/lib/python2.7/site-packages/gpustat.py'
alias watchgpu='watch --color -n1.0 python ~/.local/lib/python2.7/site-packages/gpustat.py'


for id in `seq 0 60`; do
    if [ "$id" -lt 10 ]; then
        id=0$id;
    fi
    #echo $id
    alias d$id="sshpass -plijianshu  ssh -o StrictHostKeyChecking=no lijianshu@deep$id";
done
alias gowild="sshpass -plijianshu  ssh -o StrictHostKeyChecking=no lijianshu@wild"

