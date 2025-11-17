param(
  [string]$manager = "npm"
)

$packages = @(
  "eslint",
  "@eslint/eslintrc",
  "eslint-config-next@16.0.3",
  "eslint-config-prettier",
  "eslint-plugin-prettier",
  "eslint-plugin-promise",
  "eslint-plugin-tailwindcss@^3.18.2",
  "prettier@^3.6.2",
  "prettier-plugin-tailwindcss@^0.6.14"
)

$pkgList = $packages -join " "

switch ($manager.ToLower()) {
  "pnpm" {
    Write-Host "Installing devDependencies with pnpm..."
    pnpm add -D $pkgList
    break
  }
  "yarn" {
    Write-Host "Installing devDependencies with yarn..."
    yarn add -D $pkgList
    break
  }
  default {
    Write-Host "Installing devDependencies with npm..."
    npm install --save-dev $pkgList
    break
  }
}

Write-Host "Done."
