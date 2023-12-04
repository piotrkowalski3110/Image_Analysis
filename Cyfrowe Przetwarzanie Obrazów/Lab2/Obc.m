function [ImOut] = Obc(ImIn)
    ImOut = ImIn;

    for i=1:size(ImOut,1)
        for j=1:size(ImOut,2)
            if ImOut(i,j,:) > 1
                ImOut(i,j,:) = 1;
            end
            if ImOut(i,j,:) < 0
                ImOut(i,j,:) = 0;
            end
        end
    end
end

