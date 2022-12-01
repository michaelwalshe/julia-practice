function tocamelcase(str)
    str == "" && return str

    pascal_case = isuppercase(first(str))
    words = split(str, ['_', '-'])
    newstr = ""
    for (i, word) in enumerate(words)
        if i == 1 && !(pascal_case)
            newword = lowercase(word)
        else
            newword = titlecase(word)
        end
        newstr *= newword
    end

    return newstr
end