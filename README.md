# FixStutter
通过禁用 GameBarPresenceWriter.exe 来解决 Windows 系统下游戏或应用程序卡顿（Stuttering）的方法。

## 核心思路
通过修改权限，将系统文件 GameBarPresenceWriter.exe 重命名，使系统在启动游戏时找不到该程序，从而阻止其在后台运行。

#### 操作步骤
##### 第一阶段：找到文件
打开文件资源管理器，进入路径：C:\Windows\System32。

在该目录下找到名为 GameBarPresenceWriter.exe 的文件。

##### 第二阶段：获取文件所有权
右键点击该文件，选择 属性 (Properties)。

切换到 安全 (Security) 选项卡，点击下方的 高级 (Advanced)。

在“所有者 (Owner)”旁边点击 更改 (Change)。

在弹出的输入框中，输入你当前电脑的用户名（或者是你登录用的邮箱地址），然后点击 检查名称 (Check Names)。如果正确，点击 确定 (OK)。

点击 应用 (Apply) 并确定，回到属性界面。

##### 第三阶段：修改权限
再次点击 高级 (Advanced)。

点击 添加 (Add) -> 选择主体 (Select a principal)。

再次输入你的用户名，点击 检查名称 并点击 确定。

在权限列表中勾选 完全控制 (Full control)，然后一路点击 确定 保存。

##### 第四阶段：恢复所有权（可选但推荐）
为了安全起见，建议将所有者改回系统默认的 TrustedInstaller：

回到 高级安全设置，点击所有者旁边的 更改。

在框中输入：NT Service\TrustedInstaller，点击 检查名称，然后点击 确定。

##### 第五阶段：重命名文件
现在你拥有了该文件的控制权。右键点击 GameBarPresenceWriter.exe。

选择 重命名 (Rename)，在文件名后面随便加个数字，例如改为 GameBarPresenceWriter2.exe。

这样系统启动游戏时就找不到这个进程了。

#### 最后一步
重启电脑。
