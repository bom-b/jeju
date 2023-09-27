package com.jeju.model.bean;

public class Pquestion {
	private String module ;
	private String type ;
	private Integer qnum;
	private String question;
	
	public Pquestion() {}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getQnum() {
		return qnum;
	}

	public void setQnum(Integer qnum) {
		this.qnum = qnum;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "Pquestion [module=" + module + ", type=" + type + ", qnum=" + qnum + ", question=" + question + "]";
	}

	public Pquestion(String module, String type, Integer qnum, String question) {
		super();
		this.module = module;
		this.type = type;
		this.qnum = qnum;
		this.question = question;
	}
	
	
}

