function love.graphics.roundrectangle(mode, x, y, w, h, rd, s)
   local r, g, b, a = love.graphics.getColor()
   local rd = rd or math.min(w, h)/4
   local s = s or 32
   local l = love.graphics.getLineWidth()
   
   local corner = 1
   local function mystencil()
      love.graphics.setColor(255, 255, 255, 255)
      if corner == 1 then
         love.graphics.rectangle("fill", x-l, y-l, rd+l, rd+l)
      elseif corner == 2 then
         love.graphics.rectangle("fill", x+w-rd+l, y-l, rd+l, rd+l)
      elseif corner == 3 then
         love.graphics.rectangle("fill", x-l, y+h-rd+l, rd+l, rd+l)
      elseif corner == 4 then
         love.graphics.rectangle("fill", x+w-rd+l, y+h-rd+l, rd+l, rd+l)
      elseif corner == 0 then
         love.graphics.rectangle("fill", x+rd, y-l, w-2*rd+l, h+2*l)
         love.graphics.rectangle("fill", x-l, y+rd, w+2*l, h-2*rd+l)
      end
   end
   
   love.graphics.setStencil(mystencil)
   love.graphics.setColor(r, g, b, a)
   love.graphics.circle(mode, x+rd, y+rd, rd, s)
   love.graphics.setStencil()
   corner = 2
   love.graphics.setStencil(mystencil)
   love.graphics.setColor(r, g, b, a)
   love.graphics.circle(mode, x+w-rd, y+rd, rd, s)
   love.graphics.setStencil()
   corner = 3
   love.graphics.setStencil(mystencil)
   love.graphics.setColor(r, g, b, a)
   love.graphics.circle(mode, x+rd, y+h-rd, rd, s)
   love.graphics.setStencil()
   corner = 4
   love.graphics.setStencil(mystencil)
   love.graphics.setColor(r, g, b, a)
   love.graphics.circle(mode, x+w-rd, y+h-rd, rd, s)
   love.graphics.setStencil()
   corner = 0
   love.graphics.setStencil(mystencil)
   love.graphics.setColor(r, g, b, a)
   love.graphics.rectangle(mode, x, y, w, h)
   love.graphics.setStencil()
end


