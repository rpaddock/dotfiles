function tohls() {
	if [ ! -f "$1" ]; then
		echo "Usage: tohls <input_file>"
		return 1
	fi
	ffmpeg -hide_banner -nostdin -y -guess_layout_max 0 \
		-i "$1" \
		-c:v libx264 -b:v "256k" -maxrate "256k" -bufsize "256k" -g "60" \
		-c:a aac -b:a "128k" \
		-f hls -flags global_header \
		-hls_time "10" -hls_allow_cache 1 -hls_list_size 0 \
		-use_localtime 1 -use_localtime_mkdir 1 \
		-hls_flags append_list+delete_segments+periodic_rekey+program_date_time+second_level_segment_index+temp_file \
		-hls_segment_filename "%Y%m%d-%s-%%04d.ts" \
		"index.m3u8" 
}
