#!/bin/bash

DOTFILES_DIR=~/dotfiles/.config
TARGET_DIR=~/.config

mkdir -p "$TARGET_DIR"

echo "🔗 Creando symlinks desde $DOTFILES_DIR a $TARGET_DIR..."
echo

for dir in "$DOTFILES_DIR"/*; do
  [ -d "$dir" ] || continue

  name=$(basename "$dir")
  src="$DOTFILES_DIR/$name"
  dest="$TARGET_DIR/$name"

  # Si ya existe como symlink válido, omitir
  if [[ -L "$dest" && "$(readlink -f "$dest")" == "$src" ]]; then
    echo "⏭️  $dest ya es un symlink válido. Omitido."
    continue
  fi

  # Si ya existe como carpeta real (no symlink)
  if [[ -d "$dest" && ! -L "$dest" ]]; then
    echo "⚠️  $dest ya existe como carpeta real."
    read -p "¿Reemplazarla con un symlink desde $src? (s/N): " confirm
    if [[ "$confirm" == "s" || "$confirm" == "S" ]]; then
      rm -rf "$dest"
      ln -s "$src" "$dest"
      echo "✅ Reemplazado: $dest → $src"
    else
      echo "⏭️  Saltado: $dest"
    fi
  else
    ln -sf "$src" "$dest"
    echo "✅ Symlink creado/actualizado: $dest → $src"
  fi

  echo
done

echo "📄 Resultado final (symlinks en ~/.config):"
find "$TARGET_DIR" -maxdepth 1 -type l -exec ls -l {} \;
