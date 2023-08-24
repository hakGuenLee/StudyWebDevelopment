package kr.myproject.service.usermenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.myproject.domain.UserDTO;
import kr.myproject.handler.UserInfoHandler;
import kr.myproject.mapper.usermenu.UserAccountMapper;

@Service
public class UserAccountServiceImpl implements UserAccountService {

	@Autowired
	private UserAccountMapper userAccountMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserInfoHandler userInfoHandler;
	
	//회원 로그인 처리
	@Override
	public boolean LoginComplete(HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		UserDTO userDTO = userAccountMapper.selectAccount(request.getParameter("id"));	
		
		if(userDTO != null) {
			String inputPw = request.getParameter("pw"); //view에서 사용자가 입력한 패스워드
			String dbPw = userDTO.getUser_pw(); //DB에서 가져온 패스워드
			
			if(passwordEncoder.matches(inputPw, dbPw)) {
				session.setAttribute("userDTO", userDTO);
				return true;
			}else { //비밀번호가 일치하지 않는 경우
				return false;
			}
		}
		
		return false;   //회원 정보가 아예 없는 경우
	}

	//아이디 찾기
	@Override
	public String searchUsersId(String mail) {
		
		return userAccountMapper.selectId(mail);
	}

	//회원 비밀번호 찾기 진행 절차 1 : id와 mail을 통해 일치하는 계정 여부 확인
	@Override
	public String serchUserAccountByIdAndMail(String id, String mail) {
		
		UserDTO uDto = userAccountMapper.selectUserAccountByIdAndMail(id,mail);
		
		if(uDto == null) {
			return "fail";
		}
		return uDto.getUser_id();
	}

	//회원 비밀번호 변경 처리
	@Override
	public int changePassword(String pw, String id) {
		
		String cipher = passwordEncoder.encode(pw);

		return userAccountMapper.UpdateUserPassword(id, cipher);
	}

	//회원정보 수정 페이지 이동 시 요청한 유저의 계정 정보 가져오기
	@Override
	public UserDTO getUserInfo(HttpServletRequest request) {

		String id = userInfoHandler.getUserId(request);
		
		return userAccountMapper.selectAccount(id);
	}

}
