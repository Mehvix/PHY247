Text = sprintf("Max Vogel");

I = imread ('Max_Vogel_Checkerboard.jpg');

edit =  insertText(I, [532, 26], 'Max Vogel', 'FontSize', 36, 'BoxColor', 'red', 'TextColor', 'black');
imshow(edit);
