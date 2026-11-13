WEATHER_LOC=${WEATHER_LOC:-Paderborn}   # in ~/.zshrc.local überschreibbar
_weather_file="$HOME/.cache/zsh-weather"
mkdir -p "$HOME/.cache"

_weather_update() {
  # Datei jünger als 15 Min? Dann nichts tun
  local fresh=( $_weather_file(N.mm-15) )
  (( $#fresh )) && return
  touch "$_weather_file"   # sonst würde bis zur Antwort jeder Prompt neu fetchen
  ( curl -sf --max-time 5 "https://wttr.in/${WEATHER_LOC}?format=%t" > "$_weather_file.tmp" \
      && mv "$_weather_file.tmp" "$_weather_file" ) &!
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _weather_update

_weather() {
  [[ -s $_weather_file ]] || return
  local w=$(<$_weather_file)
  w=${w#+}                 # "+7°C" → "7°C"
  echo "${w//\%/%%} "      # % escapen, sonst interpretiert der Prompt es
}

# Volle Vorhersage auf Deutsch
alias wetter='curl -s "wttr.in/${WEATHER_LOC}?lang=de"'