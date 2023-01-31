$homedrive = (join-path $env:HOMEDRIVE vimfiles)

If(!(test-path $homedrive))
{
    new-item -ItemType Directory -path $homedrive
}
copy-item "./.vimrc" (join-path $homedrive "vimrc")
