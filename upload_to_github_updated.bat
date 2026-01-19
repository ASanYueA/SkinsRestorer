@echo off
chcp 65001 >nul
echo ========================================
echo SkinsRestorer 代码上传到GitHub (更新版)
echo ========================================
echo.

echo [1/7] 配置Git用户信息...
git config --global user.name "ASanYueA"
git config --global user.email "luoyingsanyue@gmail.com"
echo ✓ Git配置完成
echo.

echo [2/7] 切换到项目目录...
cd /d "c:\中转站\MC插件\SkinsRestorer-15.9.3"
echo ✓ 已切换到项目目录
echo.

echo [3/7] 初始化Git仓库...
git init
echo ✓ Git仓库初始化完成
echo.

echo [4/7] 添加所有文件到暂存区...
git add .
echo ✓ 文件已添加到暂存区
echo.

echo [5/7] 创建提交...
git commit -m "Fix: 实现双向皮肤同步功能 + Add: GitHub Actions workflow"
echo ✓ 提交创建完成
echo.

echo [6/7] 添加远程仓库...
git remote add origin https://github.com/ASanYueA/SkinsRestorer.git
echo ✓ 远程仓库已添加
echo.

echo [7/7] 推送到GitHub...
git branch -M main
git push -u origin main
echo ✓ 代码已推送到GitHub
echo.

echo ========================================
echo 上传完成！
echo ========================================
echo.
echo 下一步：
echo 1. 访问 https://github.com/ASanYueA/SkinsRestorer
echo 2. 点击 "Actions" 标签查看构建进度
echo 3. 构建完成后下载JAR文件
echo.
echo 构建产物：
echo - SkinsRestorer-Bukkit (Bukkit/Spigot/Paper)
echo - SkinsRestorer-Bungee (BungeeCord)
echo - SkinsRestorer-Velocity (Velocity)
echo - SkinsRestorer-Mod-Fabric (Fabric模组)
echo - SkinsRestorer-Mod-NeoForge (NeoForge模组)
echo.
pause
