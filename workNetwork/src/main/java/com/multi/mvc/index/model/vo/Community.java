package com.multi.mvc.index.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community {
	private int num;
	private String job;
	private String title;
	private String name;
	private String create_date;
	private String department;
}
