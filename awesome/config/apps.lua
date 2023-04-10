local _M = {
   terminal = os.getenv('TERMINAL') or 'st',
   editor   = os.getenv('VISUAL')   or 'emacs',
   browser   = os.getenv('BROWSER')   or 'firefox',
   music   = os.getenv('BROWSER')   or 'ncmpcpp',
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
