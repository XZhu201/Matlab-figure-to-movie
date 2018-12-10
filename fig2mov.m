function fig2mov(list_num,str_head,str_tail)
% list_num choose the files with listed number to be read    
% str_head is the string before number in the file names
% str_tail is the string after the number in the file names

% also remember to set the [format of the numbers] and the [delay] below

delay = 60/length(list_num);   % set the delay, so that the movie lasts for 100 s

for i=list_num
    str_num = num2str(i, '%d');        % may need to set the format of the number
    str = [str_head,str_num,str_tail];
    fprintf('Reading %s ... \n',str);
    
    A=imread(str);
    [I,map]=rgb2ind(A,256);
    if(i==list_num(1))
        imwrite(I,map,'movefig.gif','DelayTime',delay,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',delay)  
    end
%     set(gcf,'outerposition',get(0,'screensize'));  % max the matlab window

end


fprintf('\nDone! Movie saved to movefig.gif.\n')