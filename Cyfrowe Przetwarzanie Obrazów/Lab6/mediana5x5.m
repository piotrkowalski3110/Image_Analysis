function [ResultMedian] = mediana5x5(InputImg)
    ResultMedian = InputImg;
    for i=3:size(InputImg,2)-2
        for j=3:size(InputImg,1)-2
            W = [InputImg(i-2, j-2), InputImg(i-1, j-2), InputImg(i, j-2), InputImg(i+1, j-2), InputImg(i+2, j-2),...
                 InputImg(i-2, j-1), InputImg(i-1, j-1), InputImg(i, j-1), InputImg(i+1, j-1), InputImg(i+2, j-1),...
                 InputImg(i-2, j), InputImg(i-1, j), InputImg(i, j), InputImg(i+1, j), InputImg(i+2, j),...
                 InputImg(i-2, j+1), InputImg(i-1, j+1), InputImg(i, j+1), InputImg(i+1, j+1), InputImg(i+2, j+1),...
                 InputImg(i-2, j+2), InputImg(i-1, j+2), InputImg(i, j+2), InputImg(i+1, j+2), InputImg(i+2, j+2)];
            Wsort = sort(W);
            ResultMedian(i,j) = Wsort(13);
        end
    end
end

