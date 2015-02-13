function movieList=loadMovieList(f)
	
	fid=fopen(f);

	en=0;
	movieList=[];
	while ~feof(fid)
		line=fgets(fid);

		[idx movieName]=strtok(line,' ');
		movieList=[movieList;strtrim(movieName)];
	end

	fclose(fid);