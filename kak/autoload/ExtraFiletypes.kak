hook global BufCreate (.*/)?sway$ %{
  set-option buffer filetype sh
}
