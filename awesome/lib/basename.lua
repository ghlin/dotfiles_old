
return {
  basename = function (fullpath)
    return string.gsub(fullpath, '(.*/)(.*)', '%2')
  end;

  remove_ext = function (fullpath)
    return string.gsub(fullpath, '(.*)(%..*)', '%1')
  end;
}


