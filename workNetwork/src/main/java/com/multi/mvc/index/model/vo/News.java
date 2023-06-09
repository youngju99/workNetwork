package com.multi.mvc.index.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
	private int news_no;
	private String title;
	private String date;
	private String keyword;
	private String url;
	private String site;
	private String img;
}
