htail()
{
 last=${2:-10}
 history | grep $1 | uniq | tail -n $last
}
