local a=(syn and syn.request)or request or http_Request or(http and http.request)local b=nil;local c=game:GetService("PathfindingService")local d=game:GetService("TweenService")local e=workspace.CurrentCamera;local f={}local function g(a)local a,b=e:WorldToViewportPoint(a)local a=Vector2.new(a.X,a.Y)return a end;local h={}do function h:Require(b)local a=a({Url=b;Method="GET"})if a.StatusCode==200 then return a.Body end end;function h:Run(a)local a,b=loadstring(a)if not typeof(a)=="function"then return error(string.format("Failed to run code, error: %s",tostring(b)))end;return a()end;function h:GetCodes(b)local c={}local a,b=pcall(a,{Url=b;Method="GET"})if a then for a in b.Body:gmatch("<strong>(.-)</strong>")do if not a:find(" ")then table.insert(c,a)end end end;return c end;function h:GetPlayerNames()local a={}for b,b in next,b.entityList do table.insert(a,b.Player.Name)end;return a end;function h:IsAlive(a,c)if not a then return b.isAlive end;if c==nil then c=true end;if table.find(self:GetPlayerNames(),a.Name)then local a,a=b.getEntityFromPlayer(a)return((not c)or a and a.Humanoid:GetState()~=Enum.HumanoidStateType.Dead)and a else return((not c)or a and a.Humanoid:GetState()~=Enum.HumanoidStateType.Dead)and a end end;function h:GetEnemyColor(a)if a then return Color3.new(1,0.427450,0.427450)end;return Color3.new(0.470588,1,0.470588)end;function h:GetColorFromEntity(a,b,c,d,e,f)if b then return Color3.fromHSV(a.Humanoid.Health/a.Humanoid.MaxHealth,1,1)end;if a.Team and a.Team.TeamColor.Color and c then return a.Team.TeamColor.Color end;if d then return f end;if e then return Color3.fromHSV(os.clock()%5/5,1,1)end;return self:GetEnemyColor(a.Targetable)end;function h:TeleportTo(a)b.character.HumanoidRootPart.CFrame=CFrame.new(a)end;function h:MoveTo(a,d)local c=c:FindPathAsync(b.character.HumanoidRootPart.Position,a)local e=c:GetWaypoints()if c.Status~=Enum.PathStatus.Success then return self:TeleportTo(a)end;for a=1,#e do if e[a].Action==Enum.PathWaypointAction.Jump then b.character.Humanoid.Jump=true;b.character.Humanoid:MoveTo(e[a+1].Position)if d then b.character.Humanoid.MoveToFinished:Wait()end else b.character.Humanoid:MoveTo(e[a].Position)if d then b.character.Humanoid.MoveToFinished:Wait()end end end;if c.Status==Enum.PathStatus.Success then for a,a in next,f do a:Destroy()end;table.clear(f)end end;function h:TweenTo(a,c)local c=d:Create(b.character.HumanoidRootPart,TweenInfo.new(c,Enum.EasingStyle.Linear),{CFrame=CFrame.new(a)})local a=d:Create(b.character.HumanoidRootPart,TweenInfo.new(0.25,Enum.EasingStyle.Linear),{CFrame=CFrame.new(a)})c:Play()c.Completed:Connect(function()b.character.HumanoidRootPart.Velocity=Vector3.new(0,0,0)a:Play()end)a.Completed:Connect(function()b.character.HumanoidRootPart.Velocity=Vector3.new(0,0,0)end)end;function h:DrawPath(a,d)local h=d;if d then local b=c:FindPathAsync(b.character.HumanoidRootPart.Position,a)local b=b:GetWaypoints()if#b==0 then return end;for c=1,#b do local d=Drawing.new("Line")d.Visible=true;d.From=g(b[c].Position)local e;if b[c+1]then e=b[c+1].Position else e=a end;d.To=g(e)d.Color=Color3.new(1,1,1)d.Thickness=2;d.Transparency=1;table.insert(f,{Line=d,To=e,From=b[c].Position})end;task.spawn(function()while h do task.wait()for a,a in next,f do local b,b=e:WorldToViewportPoint(a.From)if b then a.Line.Visible=true else a.Line.Visible=false end;a.Line.From=g(a.From)a.Line.To=g(a.To)a.Line.Color=Color3.new(1,1,1)end end end)end end end;b=h:Run(h:Require("https://raw.githubusercontent.com/EE234/8F85E/main/EntityHandler.lua",true,true))b.fullEntityRefresh()return b,h
