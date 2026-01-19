# 上传代码到GitHub指南

## 前提条件

✅ Git已安装（版本 2.52.0.windows.1）
✅ 已修改代码（双向皮肤同步功能）
✅ GitHub账号：ASanYueA

## 使用方法

### 方法1：使用批处理文件（推荐）

1. **打开能使用git的终端**
   - 在 `C:\Users\三月>` 终端中（你已经能运行git命令的地方）
   - 或者打开Git Bash

2. **运行批处理文件**
   ```bash
   cd "c:\中转站\MC插件\SkinsRestorer-15.9.3"
   upload_to_github.bat
   ```

3. **按提示操作**
   - 批处理文件会自动执行所有步骤
   - 如果需要输入GitHub用户名和密码，请输入你的GitHub凭据

### 方法2：手动执行命令

在能使用git的终端中，依次执行以下命令：

```bash
# 1. 配置Git用户信息
git config --global user.name "ASanYueA"
git config --global user.email "luoyingsanyue@gmail.com"

# 2. 切换到项目目录
cd "c:\中转站\MC插件\SkinsRestorer-15.9.3"

# 3. 初始化Git仓库
git init

# 4. 添加所有文件到暂存区
git add .

# 5. 创建提交
git commit -m "Fix: 实现双向皮肤同步功能"

# 6. 添加远程仓库
git remote add origin https://github.com/ASanYueA/SkinsRestorer.git

# 7. 推送到GitHub
git branch -M main
git push -u origin main
```

## 注意事项

### 1. GitHub仓库地址

如果你的GitHub仓库地址不是 `https://github.com/ASanYueA/SkinsRestorer.git`，请修改第6步中的地址。

例如：
- 如果你的仓库名是 `SkinsRestorer-Fix`，则地址为：`https://github.com/ASanYueA/SkinsRestorer-Fix.git`
- 如果你的仓库在组织下，则地址为：`https://github.com/组织名/SkinsRestorer.git`

### 2. 身份验证

推送时可能需要身份验证：
- **使用Personal Access Token（推荐）**：
  1. 访问 https://github.com/settings/tokens
  2. 点击 "Generate new token" → "Generate new token (classic)"
  3. 选择权限：`repo`（完整仓库访问权限）
  4. 生成token并复制
  5. 推送时，用户名输入你的GitHub用户名，密码输入token

- **使用SSH密钥**：
  ```bash
  # 生成SSH密钥
  ssh-keygen -t ed25519 -C "luoyingsanyue@gmail.com"

  # 添加到GitHub
  # 复制 ~/.ssh/id_ed25519.pub 的内容
  # 访问 https://github.com/settings/keys 添加SSH密钥

  # 修改远程仓库地址为SSH格式
  git remote set-url origin git@github.com:ASanYueA/SkinsRestorer.git
  ```

### 3. 如果仓库已存在

如果GitHub仓库中已经有文件，可能会遇到冲突。解决方法：

```bash
# 方法1：强制推送（会覆盖远程仓库）
git push -u origin main --force

# 方法2：先拉取远程仓库
git pull origin main --allow-unrelated-histories
git push -u origin main
```

## 推送成功后的操作

### 1. 查看GitHub Actions构建

1. 访问你的GitHub仓库：https://github.com/ASanYueA/SkinsRestorer
2. 点击 "Actions" 标签
3. 查看构建进度（通常需要2-5分钟）

### 2. 下载构建产物

1. 构建完成后，点击完成的构建任务
2. 在 "Artifacts" 部分下载JAR文件：
   - **SkinsRestorer-Bukkit**：Bukkit版本的JAR文件
   - **SkinsRestorer-Mod**：Mod版本的JAR文件

### 3. 部署到服务器

**Bukkit版本**：
1. 下载 `SkinsRestorer-Bukkit` artifact
2. 解压得到JAR文件
3. 复制到Minecraft服务器的 `plugins` 文件夹
4. 重启服务器

**Mod版本**：
1. 下载 `SkinsRestorer-Mod` artifact
2. 解压得到JAR文件
3. 复制到Minecraft服务器的 `mods` 文件夹
4. 重启服务器

## 常见问题

### Q1：提示 "remote: Invalid username or password"
A：GitHub已不再支持密码登录，需要使用Personal Access Token。参考上面的"身份验证"部分。

### Q2：提示 "error: failed to push some refs"
A：远程仓库已有内容，使用 `git pull origin main --allow-unrelated-histories` 先拉取。

### Q3：GitHub Actions构建失败
A：查看Actions日志，检查具体错误信息。常见问题：
- 代码语法错误
- 依赖下载失败
- 网络问题

### Q4：如何只构建特定模块？
A：修改 `.github/workflows/build.yml` 文件，将：
```yaml
run: ./gradlew :skinsrestorer-bukkit:shadowJar --no-daemon
```
改为：
```yaml
run: ./gradlew :skinsrestorer-bungee:shadowJar --no-daemon
```

## 技术支持

如有问题，可以：
1. 查看SkinsRestorer官方文档：https://skinsrestorer.net/docs
2. 访问GitHub仓库：https://github.com/SkinsRestorer/SkinsRestorer
3. 提交Issue到你的仓库

---

**创建日期**：2026-01-19
**版本**：SkinsRestorer 15.9.3
**修改者**：ASanYueA
