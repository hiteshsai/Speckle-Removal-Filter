function psnr_Value = PSNR(A,B) % A is reference of clearn image, B is noisy approximation of it
% PSNR (Peak Signal to noise ratio)

if (size(A) ~= size(B))
   error('The size of the 2 matrix are unequal')

   psnr_Value = NaN;
   return; 
elseif (A == B)
   disp('Images are identical: PSNR has infinite value')

   psnr_Value = Inf;
   return;   
else

    maxValue = double(max(A(:)));

    % Calculate MSE, mean square error.
    mseImage = (double(A) - double(B)) .^ 2;
    [rows columns] = size(A);
    
    mse = sum(mseImage(:)) / (rows * columns);

    % Calculate PSNR (Peak Signal to noise ratio)
    %psnr_Value = 10 * log10( 256^2 / mse);
    psnr_Value = 20 * log10( maxValue / sqrt(mse));
end


end