# file: muttComplete
# Mutt  parameter-completion

_MuttComplete ()   #  By convention, the function name
{                 #+ starts with an underscore.
  local cur
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.

  cur=${COMP_WORDS[COMP_CWORD]}

  COMPREPLY=( $( compgen -W 'FS inTUM GMail' -- $cur ) )
# Generate the completion matches and load them into $COMPREPLY array.

  return 0
}

complete -c -F _MuttComplete mutt
