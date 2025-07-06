#!/bin/bash

DOTFILES_DIR=~/dotfiles/.config
TARGET_DIR=~/.config

mkdir -p "$TARGET_DIR"

echo "🔗 Creando symlinks desde $DOTFILES_DIR a $TARGET_DIR..."

for dir in "$DOTFILES_DIR"/*; do
  [ -d "$dir" ] || continue  # Salta si no es un directorio

  name=$(basename "$dir")
  src="$DOTFILES_DIR/$name"
  dest="$TARGET_DIR/$name"

  # Si ya existe como directorio real (y no es un symlink)
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
    echo "✅ Symlink: $dest → $src"
  fi
done
