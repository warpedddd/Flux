local Silent = {
    Enabled = true,
    Part = "HumanoidRootPart",
    Prediction = .1815
}


-- // Services // --
local G                   = game
local Run_Service         = game:GetService("RunService")
local Players      	  = G:GetService("Players");
local Local_Player        = Players.LocalPlayer;
local Get_Mouse_Pos       = Local_Player:GetMouse();
local Current_Camera      = G:GetService("Workspace").CurrentCamera;
local Replicated_Storage  = game:GetService("ReplicatedStorage")

-- // Variables // --
local Target              = nil;
local V2                  = Vector2.new
local Fov                 = Drawing.new("Circle") 

--  // Update Fov Properties // --
local fov = function()
    Fov.Visible           = true
    Fov.Radius            = 90
    Fov.Position          = V2(Get_Mouse_Pos.X, Get_Mouse_Pos.Y + (G:GetService("GuiService"):GetGuiInset().Y))
    return Fov
end

-- // Get Closest Player // --
local GetClosestPlr; GetClosestPlr = function()
    local ClosestTarget = nil;
    local MaxDistance   = math.huge;
    -- // Loops through the player list // --
    for value, index in pairs(Players:GetPlayers()) do
        -- // Excludes the local player from the for loop // --
        if index.Character and index ~= Local_Player and index.Character:FindFirstChild("HumanoidRootPart") then
            -- // Gets distance // --
            local Position, OnScreen = Current_Camera:WorldToScreenPoint(index.Character.HumanoidRootPart.Position)
            local Distance = (V2(Position.X, Position.Y) - V2(Get_Mouse_Pos.X, Get_Mouse_Pos.Y)).Magnitude
            -- // Stops if the player is not OnScreen ( Checks if the pivot is not available ) // --
            if (OnScreen ~= true) then
                continue;
            end
            -- // If the distance is less than math.huge // --
            if (Fov.Radius > Distance and Distance < MaxDistance) then
                MaxDistance = Distance
                ClosestTarget = index
            end
        end
    end
    -- // Returns value // --
    return (ClosestTarget)
end

-- // Loop // --
Run_Service.RenderStepped:Connect(function()
    Target = GetClosestPlr()
    fov()
end)

-- // Hook without hook meta methods ( Solara deoesn't support this ) // --
local Tool; Tool = function(index, connection)
    if index:IsA("Tool") then
        -- // If theres an ongoing connection it will disconnect it // --
        if connection then
            connection:Disconnect()
        end
        
        index.Activated:Connect(function() 
		    if Target and Target.Character then
                Replicated_Storage.MainEvent:FireServer("UpdateMousePos", Target.Character[Silent.Part].Position + Target.Character[Silent.Part].Velocity * Silent.Prediction)
            end
        end)
    end
end

Local_Player.Character.ChildAdded:Connect(function(index)
    Tool(index)
end)


-- // Made by @wxrpedd // --
-- // https://discord.gg/GEZ5suPy2t // --


