                            -- // Table Variables // --
                            local ES  = Enum.EasingStyle;
                            local ED  = Enum.EasingDirection;
                            local C3  = Color3.new;
                            local V3  = Vector3.new;
                            local V2  = Vector2.new;
                            local On  = true;
                            local Off = false;

                            -- // Distances (Studs) // -- 
                            local VeryNear, Near, Mid, Far, VeryFar, ExtremelyFar = 50, 100, 150, 200, 250, 300 

                            -- // Settings // --
                            local Settings      = {
                                UncapFps        = On;
                                FpsCap          = 0; 
                            }

                            -- // Aim Assist // --
                            local Flux          = {
                                Enabled         = On;                   -- [Boolean]
                                Bind            = "C";                  -- [String]
                                UseEasing       = On;                   -- [Boolean]
                                UseJitter       = Off;                  -- [Boolean]
                                DahoodMode      = On;                   -- [Boolean]
                                
                                EasingStyle     = ES.Bounce;            -- [https://create.roblox.com/docs/reference/engine/enums/EasingStyle]
                                EasingDirection = ED.InOut;             -- [https://create.roblox.com/docs/reference/engine/enums/EasingDirection]
                                
                                HitPartOffset   = 0;                    -- [Decimal or Integer]
                                HitPart         = "HumanoidRootPart";   -- [String]
                                FovVisible      = Off;                  -- [Boolean]
                                FovSize         = 300;                  -- [Decimal or Integer]
                                
                                JitterFactor    = 0.5;                  -- [Decimal or Integer]
                                JitteringX      = 1;                    -- [Decimal or Integer]
                                JitteringY      = 2;                    -- [Decimal or Integer]
                                JitteringZ      = 1;                    -- [Decimal or Integer]

                                Smoothness      = 0.001;

                                SmoothnessX     = 0.03;                 -- [Decimal or Integer]
                                SmoothnessY     = 0.02;                 -- [Decimal or Integer]
                                SmoothnessZ     = 0.03;                 -- [Decimal or Integer]

                                PredictionX     = 0.11;                 -- [Decimal]
                                PredictionY     = 0.11;                 -- [Decimal]
                                PredictionZ     = 0.11;                 -- [Decimal]

                                ResolvedX       = 0.1815;               -- [Decimal]
                                ResolvedY       = 0;                    -- [Decimal or Integer]
                                ResolvedZ       = 0.1815;               -- [Decimal]
                            };

                            -- // Bullet Redirector // --
                            local SilentAim     = {
                                Enabled         = On;                   -- [Boolean]
                                UseBind         = On;                   -- [Boolean]
                                Bind            = "P";                  -- (https://create.roblox.com/docs/reference/engine/enums/KeyCode - [String])
                                
                                Customization   = {
                                    FovType3           = On;            -- [Boolean] (Coming soon I cba rn tbh)
                                    FovType3Prediction = 0.07;          -- [Decimal]
                                    FovVisible         = On;            -- [Boolean]
                                    FovSize            = 80;            -- [Integer]
                                    FovFilled          = Off;           -- [Boolean]
                                    FovColor           = 255, 255, 255; -- [Color3]
                                    FovThickness       = 1;             -- [Integer]
                                    FovTransparency    = 0.3;           -- [Decimal]
                                };

                                HitPart         = "HumanoidRootPart";   -- [String]
                                
                                ClosestPart     = On;                   -- [Boolean]
                                ClosestPoint    = On;                   -- [Boolean]

                                Prediction      = {
                                    Mode        = V3;                   -- Variable (V2 or V3)
                                    [1]         = 0.1815;               -- (X AXIS) - [Decimal]
                                    [2]         = 0.069;                -- (Y AXIS) - [Decimal]
                                    [3]         = 0.1815;               -- (Z AXIS) - [Decimal]  NOTE: If V2 is on this wont apply
                                };

                                AutomatedPred = {
                                    Enabled = On;                       -- [Boolean]
                                    Math    = "";                       -- // Math.Floor or Math.Round or None
                                    Axis    = "X, Z";                   -- Axis all axises = X Y Z (has to be capital btw)
                                };

                                Range             = {
                                    Enabled       = On;                 -- [Boolean]
                                    UsePrediction = Off;                -- [Boolean]
                                    VeryNear         = {
                                        Fov          = 70;              -- [Integer]
                                        PredictionX  = 0.1815;          -- [Decimal]
                                        PredictionY  = 0.067;           -- [Decimal]
                                        PredictionZ  = 0.1815;          -- [Decimal]
                                    };
                                    Near             = {
                                        Fov          = 60;              -- [Integer]
                                        PredictionX  = 0.1816;          -- [Decimal]
                                        PredictionY  = 0.067;           -- [Decimal]
                                        PredictionZ  = 0.1816;          -- [Decimal]
                                    };
                                    Mid              = {
                                        Fov          = 50;              -- [Integer]
                                        PredictionX  = 0.1821;          -- [Decimal]
                                        PredictionY  = 0.067;           -- [Decimal]
                                        PredictionZ  = 0.1821;          -- [Decimal]
                                    };
                                    Far              = {
                                        Fov          = 10;              -- [Integer]
                                        PredictionX  = 0.1831;          -- [Integer]
                                        PredictionY  = 0.067;           -- [Integer]
                                        PredictionZ  = 0.1831;          -- [Integer]
                                    };
                                    VeryFar          = {
                                        Fov          = 8;               -- [Integer]
                                        PredictionX  = 0.1841;          -- [Integer]
                                        PredictionY  = 0.067;           -- [Integer]
                                        PredictionZ  = 0.1841;          -- [Integer]
                                    };
                                    ExtremelyFar     = {
                                        Fov          = 7;               -- [Integer]
                                        PredictionX  = 0.1851;          -- [Integer]
                                        PredictionY  = 0.067;           -- [Integer]
                                        PredictionZ  = 0.1851;          -- [Integer]
                                    };
                                };
                            };


                            -- // Macro // --
                            local Macro     = {
                                Enabled     = On;                       -- [Boolean] 
                                Bind        = "X";                      -- [String] 
                                Type        = "3rd";                    -- [String]
                                Toggle      = "Hold"                    -- [Boolean]
                                Delay       = 10;                       -- [Integer]
                            };

                            -- // Inventory Sorter // --
                            local Sorter    = {
                                Enabled = On;                           -- [Boolean] 
                                Keybind = "L";                          -- [String] 
                                Slot1   = "[Double-Barrel SG]";         -- [String] 
                                Slot2   = "[Revolver]";                 -- [String] 
                                Slot3   = "[TacticalShotgun]";          -- [String] 
                                Slot4   = "[Cranberry]";                -- [String] 
                                Slot5   = "[Chicken]";                  -- [String] 
                                Slot6   = "[Pizza]";                    -- [String] 
                                Slot7   = "[Taco]";                     -- [String] 
                                Slot8   = "[Milk]";                     -- [String] 
                                Slot9   = "[Hamburger]";                -- [String] 
                                Slot0   = "";                           -- [String] 

                                Remove  = {
                                    Items = {"[Wallet]", "[Phone]", "[Boombox]"}
                                };
                            };


                            -- // Color Settings // --
                            local Color         = {
                                Enabled         = On;                   -- [Boolean] 
                                Brightness      = 0.1;                  -- [Integer]
                                Contrast        = 0.06;                 -- [Integer]
                                Saturation      = 0.9;                  -- [Integer]
                            };
