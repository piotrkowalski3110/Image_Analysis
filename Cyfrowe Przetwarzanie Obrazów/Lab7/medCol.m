function [ResultMedian] = medCol(InputImg)
    ResultMedian = InputImg;
    for i=2:size(InputImg,2)-1
        for j=2:size(InputImg,1)-1
            Standard = [InputImg(i-1, j-1), InputImg(i-1, j), InputImg(i-1, j+1);
                 InputImg(i, j-1), InputImg(i, j), InputImg(i, j+1);
                 InputImg(i+1, j-1), InputImg(i+1, j), InputImg(i+1, j+1)];
        end
    end
end

