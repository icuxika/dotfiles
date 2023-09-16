htail()
{
  last=${2:-10}
  history | grep $1 | uniq | tail -n $last
}

hcut() 
{
  last=${2:-20}
  history | tail -n "+$1" | head -n $last
}
