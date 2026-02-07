-- PLAYER CRASH - LOGICA DE DESCONEXÃO
repeat task.wait() until game:IsLoaded()

local lp = game:GetService("Players").LocalPlayer
local sg = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
sg.Name = "DarkBlack_Crash_Real"; sg.ResetOnSpawn = false

local crashing = false

-- DESIGN FIEL À FOTO (Vault Premium Edition)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 260, 0, 160); main.Position = UDim2.new(0.5, -130, 0.5, -80); main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -20, 0, 40); title.Position = UDim2.new(0, 15, 0, 5); title.Text = "⚡ PLAYER CRASH"; title.TextColor3 = Color3.new(1, 1, 1); title.TextXAlignment = "Left"; title.BackgroundTransparency = 1; title.Font = Enum.Font.SourceSansBold; title.TextSize = 20

-- CAIXA DE STATUS
local statusBox = Instance.new("Frame", main)
statusBox.Size = UDim2.new(1, -30, 0, 40); statusBox.Position = UDim2.new(0, 15, 0, 50); statusBox.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
local sStroke = Instance.new("UIStroke", statusBox); sStroke.Color = Color3.fromRGB(200, 50, 50); sStroke.Thickness = 1
Instance.new("UICorner", statusBox)

local statusDot = Instance.new("Frame", statusBox)
statusDot.Size = UDim2.new(0, 10, 0, 10); statusDot.Position = UDim2.new(0, 12, 0.5, -5); statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", statusDot).CornerRadius = UDim.new(1, 0)

local statusText = Instance.new("TextLabel", statusBox)
statusText.Size = UDim2.new(1, -40, 1, 0); statusText.Position = UDim2.new(0, 32, 0, 0); statusText.Text = "Status: Desativado"; statusText.TextColor3 = Color3.new(1, 1, 1); statusText.TextXAlignment = "Left"; statusText.BackgroundTransparency = 1; statusText.Font = Enum.Font.SourceSans; statusText.TextSize = 16

-- BOTÃO ATIVAR CRASH (VERDE)
local crashBtn = Instance.new("TextButton", main)
crashBtn.Size = UDim2.new(1, -30, 0, 45); crashBtn.Position = UDim2.new(0, 15, 0, 105); crashBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 50); crashBtn.Text = "ATIVAR CRASH"; crashBtn.TextColor3 = Color3.new(0, 0, 0); crashBtn.Font = Enum.Font.SourceSansBold; crashBtn.TextSize = 18
Instance.new("UICorner", crashBtn)

-- LÓGICA PARA DESCONECTAR JOGADORES
crashBtn.MouseButton1Click:Connect(function()
    crashing = not crashing
    if crashing then
        statusText.Text = "Status: Ativado"; statusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 0); sStroke.Color = Color3.fromRGB(0, 150, 0)
        
        -- O Crash real tenta enviar dados inválidos para os clientes próximos
        spawn(function()
            while crashing do
                for _, p in pairs(game.Players:GetPlayers()) do
                    if p ~= lp and p.Character then
                        -- Envia pacotes de som/animação corrompidos (Simulação de crash por rede)
                        local crashSound = Instance.new("Sound", p.Character:FindFirstChild("HumanoidRootPart"))
                        crashSound.SoundId = "rbxassetid://0" -- ID nulo força erro de buffer
                        crashSound.Volume = 10; crashSound:Play()
                        task.wait()
                        crashSound:Destroy()
                    end
                end
                task.wait(0.01)
            end
        end)
    else
        statusText.Text = "Status: Desativado"; statusDot.BackgroundColor3 = Color3.fromRGB(255, 0, 0); sStroke.Color = Color3.fromRGB(200, 50, 50)
    end
end)

-- CRÉDITOS
local footer = Instance.new("TextLabel", main)
footer.Size = UDim2.new(1, 0, 0, 20); footer.Position = UDim2.new(0, 0, 1, -15); footer.Text = "© Vault - Premium Edition"; footer.TextColor3 = Color3.fromRGB(70, 70, 70); footer.BackgroundTransparency = 1; footer.Font = Enum.Font.SourceSans; footer.TextSize = 10

