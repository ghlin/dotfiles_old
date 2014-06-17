
return {
  basename = function (fullpath)
    return string.gsub(fullpath, '(.*/)(.*)', '%2')
  end
}


