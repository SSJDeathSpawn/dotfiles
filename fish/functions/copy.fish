function copy --wraps cp 
  command mkdir -p $argv[-1] && cp $argv
end
